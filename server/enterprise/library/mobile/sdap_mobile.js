/**
 * Created by lancelrq on 16/9/16.
 */
var extend = require('node.extend');
var crypto = require('crypto');
module.exports = function *(next) {
    var sender = this;
    this.mobile.signatureProvider = {
        createSignature: function () {
            var timestamp = sender.getSysTime();
            var nonce = sender.mobile.signatureProvider.getNonce(16);
            var signature = '';
            var tempStr = [
                sender.const.SDAP_MOBILE_TOKEN,
                timestamp,
                nonce
            ];
            tempStr.sort();
            var sha1_provider = crypto.createHash('sha1');
            sha1_provider.update(tempStr.join(""));
            signature = sha1_provider.digest('hex');
            return {
                timestamp: timestamp,
                nonce: nonce,
                signature: signature
            }
        },
        getNonce: function (len) {
            var str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var outs = '';
            for(var i = 0; i < len; i++){
                var rand = Math.floor(Math.random() * str.length);
                outs += str.charAt(rand);
            }
            return outs;
        }
    };
    this.mobile.call = function (url, data, type, timeout) {
        var signData = sender.mobile.signatureProvider.createSignature();
        console.log(extend(data, signData));
        return sender.call(url, extend(data, signData), type, timeout);
    };
    yield next;
};