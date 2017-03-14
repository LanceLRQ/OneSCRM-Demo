/**
 * Created by lancelrq on 16/9/8.
 */
var json2xml = require('json2xml');
module.exports = function *(next) {
    var sender = this;
    this.wechat.response = {};
    // 微信应答消息中间件
    this.wechat.response.text = function (ToUserName, FromUserName, Content) {
        var data = {
            xml: {
                ToUserName: ToUserName,
                FromUserName: FromUserName,
                CreateTime: sender.getSysTime(),
                MsgType: 'text',
                Content: Content
            }
        };
        var xml = json2xml(data);
        var xmlEncrypted = sender.wechat.msgBaseProvider.encodeAES(xml);
        var tm = sender.getSysTime();
        var nonce = sender.wechat.signatureProvider.genNonce();
        return json2xml({
            xml: {
                Encrypt: xmlEncrypted,
                MsgSignature: sender.wechat.signatureProvider.getSignature(xmlEncrypted, tm, nonce),
                TimeStamp: tm,
                Nonce: nonce
            }
        });
    };
    yield next;
};