/**
 * 微信事件推送处理单元: MsgType == event
 * Created by lancelrq on 16/9/16.
 */

var actions = require('./actions');
module.exports = function () {
    return function *(next) {
        var msg_body = this.wechat.body;
        var appid = this.params.appid;

        switch (msg_body.Event){
            case 'CLICK':
            {
                switch (msg_body.EventKey){
                    case 'VIP_BIND_CARD':
                    {
                        yield actions('VIP_BIND_CARD');
                        break;
                    }
                }
                break;
            }
        }
    };
};
