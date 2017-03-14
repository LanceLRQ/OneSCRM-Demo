/**
 * 微信用户登录接口回调
 * Created by lancelrq on 16/9/10.
 */

module.exports = function *(next) {
    var code = this.query.code;
    var state = this.query.state;
    var appid = this.params.appid;
    try {
        if (code == undefined || state == undefined) {
            yield this.render_error_page(-4);
            return false;
        }
        var rel = yield this.wechat.api(this.const.WECHAT_API.SNS.OAUTH2_COMPONENT_ACCESS_TOKEN, {
            appid: appid,
            code: code,
            grant_type: "authorization_code",
            component_appid: this.const.COMPONENT_APP_ID,
            component_access_token: this.wechat.component.accessToken
        }, null);
        var openid = rel.openid;
        var access_token = rel.access_token;
        var rel_info = yield this.wechat.api(this.const.WECHAT_API.SNS.USERINFO, {
            access_token: access_token,
            openid: openid,
            lang: "zh_CN"
        }, null);


        var mpInfo = yield this.wechat.mpInfo(appid);
        var loginResult = yield this.mobile.call(this.const.SDAP_API.MOBILE.VIP.LOGIN_CHECK, {
            wxOpenid: openid,
            enterpriseId: mpInfo.enterpriseId
        });

        if(loginResult.errcode != 0){
            if(this.const.DEBUG) console.log(loginResult);
            yield this.render_error_page(loginResult.errcode != undefined ? loginResult.errcode : -5, null, 'none');
            return false;
        }
        
        switch (state){
            case 'mobile_vip_vipcard_get':{
                this.redirect(this.router.url('mobile_vip_vipcard_get', appid, openid));
                break;
            }
        }

    }catch(ex){
        if(this.const.DEBUG) console.log(ex);
        yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -5, null, 'none');
        return false;
    }
};