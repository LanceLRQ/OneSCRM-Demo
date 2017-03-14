/**
 * Created by lancelrq on 16/9/10.
 * 启用微信消息校验系统
 */
var raw_body = require('raw-body');

module.exports = function *(next) {
    
    if (/^(POST)$/i.test(this.method)) {
        try {
            // 解析微信接口数据包
            var raw_body = yield parse_raw_body(this.req);
            this.wechat.body = yield this.wechat.msgBaseProvider.parse(raw_body);

        } catch (ex) {
            if(this.const.DEBUG) console.log(ex);
            this.body = 'WeChat API Failed';
            return;
        }
    }
    // 进行微信接口功能校验
    var sign = this.wechat.signatureProvider.getSignature();
    var checkup = (this.wechat.signatureProvider.encrypt_type == 'aes' && (/^(POST)$/i.test(this.method)))
        ? (sign == this.wechat.signatureProvider.msg_signature)
        : (sign == this.wechat.signatureProvider.signature);
    if(checkup) {
        yield next;
    }else{
        this.body = 'Check Signature Failed';
    }
};

function parse_raw_body(request) {
    var len = request.headers['content-length'];
    return new Promise(function (resolve, reject) {
        raw_body(request, { limit: '10mb', encoding: 'utf8', length: len })
            .then(function(str) {
                resolve(str);
            })
            .catch(function (err) {
                reject(err);
            });
    });
}