var xml2js = require('xml2js');
var crypto = require('crypto');

module.exports = function *(next) {
    this.wechat.msgBaseProvider = MsgBaseProvider(this);
    yield next;
};

var MsgBaseProvider = function (sender){
    var msgBaseProvider = {
        sender: sender,
        self: this,
        parse: function (xmlMsg) {
            return new Promise(function (resolve, reject) {
                // 进行xml转json处理
                xml2js.parseString(xmlMsg, { explicitArray : false, ignoreAttrs : true }, function (err, result) {
                    if(err){
                        reject(err)
                    }
                    try{
                        //判断消息体是否是加密内容
                        if(result.xml.Encrypt != undefined){
                            sender.wechat.RAW = result.xml;
                            //解密消息体
                            var msgBody = msgBaseProvider.decodeAES(result.xml.Encrypt);
                            //进行二次xml解析
                            xml2js.parseString(msgBody, { explicitArray : false, ignoreAttrs : true }, function (err, result) {
                                if(err){
                                    reject(err)
                                }
                                try {
                                    //返回解包内容
                                    resolve(result.xml);
                                }catch (ex){
                                    reject(ex);
                                }
                            });
                        }else{
                            //返回解包内容
                            resolve(result.xml)
                        }
                    }catch (ex){
                        console.log(ex);
                        reject(ex);
                    }
                });

            })
        },
        decodeAES: function (encodedMsg) {
            // 构造AES密钥
            var asekey = new Buffer(sender.const.COMPONENT_ENCODING_AES_KEY + '=' , 'base64');
            //构造AES-256-CBC处理程序，其中IV是AESkey的前16位
            var decipher = crypto.Decipheriv('aes-256-cbc', asekey, asekey.slice(0, 16));
            decipher.setAutoPadding(auto_padding=false);
            var plain_text = decipher.update(encodedMsg, 'base64', 'utf8')+ decipher.final('utf8');
            //返回解密结果，编码格式为utf-8，（前20位为无意义数据）
            return plain_text.slice(20, plain_text.lastIndexOf(">")+1);

        },
        encodeAES: function (sourceMsg) {

            var text = new Buffer(sourceMsg), // 一个中文长度为3
                pad = this.encLen(text.length),
                pack = this.fullPKCS7(20 + text.length + sender.const.COMPONENT_APP_ID.length),
                random = crypto.randomBytes(8).toString('hex'),
                content = random + pad + text.toString('binary') + sender.const.COMPONENT_APP_ID + pack;

            try {
                // 构造AES密钥
                var asekey = new Buffer(sender.const.COMPONENT_ENCODING_AES_KEY + '=' , 'base64');
                var cipher = crypto.createCipheriv('aes-256-cbc', asekey, asekey.slice(0, 16));
                cipher.setAutoPadding(auto_padding=false);
                var crypted = cipher.update(content, 'binary', 'base64') + cipher.final('base64');
                return crypted;
            } catch (e) {
                return ""
            }
        },
        encLen: function (len) {
            var buf = new Buffer(4);
            buf.writeUInt32BE(len);
            //console.log('enclen:', len, buf.toString('binary'));
            return buf.toString('binary');
        },
        fullPKCS7: function (text_length) {
            // 计算需要填充的位数
            const PKCS7_block_size = 32;
            var amount_to_pad = PKCS7_block_size - (text_length % PKCS7_block_size);
            if (amount_to_pad === 0) {
                amount_to_pad = PKCS7_block_size;
            }
            // 获得补位所用的字符
            var pad = String.fromCharCode(amount_to_pad), s = [];

            for (var i=0; i<amount_to_pad; i++)
                s.push(pad);
            return s.join('');
        }
    };
    return msgBaseProvider;
};