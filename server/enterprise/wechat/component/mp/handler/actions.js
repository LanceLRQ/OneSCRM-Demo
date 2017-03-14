/**
 * Created by lancelrq on 16/9/16.
 */

module.exports = function (action_name) {
    switch (action_name){
        case "VIP_BIND_CARD":{
            return function *(next) {
                var msg_body = this.wechat.body;
                var appid = this.params.appid;
                var content = '你好呀宝宝，<a href="http://' + this.const.DOMAIN + this.router.url('mobile_vip_vipcard_get', appid, msg_body.FromUserName) +'">点击这里去领卡吧</a>';
                this.body = this.wechat.response.text(msg_body.FromUserName, msg_body.ToUserName, content);
            }
        }
    }
};