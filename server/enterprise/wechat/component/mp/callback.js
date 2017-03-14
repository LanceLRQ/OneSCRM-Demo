/**
 * Created by lancelrq on 16/9/4.
 * 微信第三方平台通用回调接口
 */
var event_handler = require('./handler/event')

module.exports = function *(next) {

    try {
        var msg_body = this.wechat.body;
        var appid = this.params.appid;
        if(this.const.DEBUG) console.log(msg_body);
        switch(msg_body.MsgType){
            case 'text':
                this.body = this.wechat.response.text(msg_body.FromUserName, msg_body.ToUserName, '爱你哦');
                break;
            case 'event':
                yield event_handler();
                break;
            default:
                this.body = this.wechat.response.text(msg_body.FromUserName, msg_body.ToUserName, '未知指令');
                break;
        }
    }catch(ex){
        console.log(ex);
    }
};
