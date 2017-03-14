/**
 * 微信公众平台认证类接口 - 检验消息是否来自微信服务器
 * @param token
 * @param timestamp
 * @param nonce
 * @param signature
 */
var crypto = require('crypto');

/**
 * 微信基础消息校验检查中间件
 * @returns {Function}
 */
module.exports = function *(next) {
    var sender = this;
    var wechatSignatureProvider = {
        signature: sender.query.signature,
        timestamp: sender.query.timestamp,
        nonce: sender.query.nonce,
        encrypt_type: sender.query.encrypt_type,
        msg_signature: sender.query.msg_signature,
        getSignature: function(msg_body, timestamp, nonce){
            var encrypt_type = (/^(GET)$/i.test(sender.method) === true) ? '' : this.encrypt_type ;
            if (encrypt_type == 'aes'){
                tempStr = [
                    sender.const.COMPONENT_TOKEN,
                    (timestamp != undefined) ? timestamp : this.timestamp,
                    (nonce != undefined) ? nonce: this.nonce,
                    (msg_body != undefined) ? msg_body : sender.wechat.RAW.Encrypt
                ];
                tempStr.sort();
            }else{
                tempStr = [
                    sender.const.COMPONENT_TOKEN,
                    (timestamp != undefined) ? timestamp : this.timestamp,
                    (nonce != undefined) ? nonce: this.nonce
                ];
                tempStr.sort();
            }
            var sha1_provider = crypto.createHash('sha1');
            sha1_provider.update(tempStr.join(""));
            return sha1_provider.digest('hex');

        },
        genNonce: function () {
            return Math.random();
        }
    };

    // 注册微信签名中间件
    this.wechat.signatureProvider = wechatSignatureProvider;
    yield next;
};