/**
 * 授权跳转请求构造
 * Created by lancelrq on 16/9/10.
 */

module.exports = function *(next) {
    var app_id = this.params.appid;         // 弹回用的appid
    var state = this.query.state;
    var url = encodeURIComponent("https://" + this.const.DOMAIN + this.router.url('wx_mobile_vip_auth_callback', app_id));
    var target = this.const.WECHAT_API.CONNECT.OAUTH2_AUTHORIZE +
                "?appid=" + app_id +
                "&redirect_uri=" + url +
                "&response_type=code&scope=snsapi_userinfo" +
                "&state=" + state +
                "&component_appid=" +
                this.const.COMPONENT_APP_ID +
                "#wechat_redirect";
    this.redirect(target)
};