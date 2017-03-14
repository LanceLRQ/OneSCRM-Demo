module.exports = function *(next) {
    try {
        var mpInfo = yield this.wechat.mpInfo(this.params.appid);
        var result = yield this.mobile.call(this.const.SDAP_API.MOBILE.VIP.ISLOGIN, {
            wxOpenid: this.params.openid,
            enterpriseId: mpInfo.enterpriseId
        });
        this.mobile.user_islogin = (result.errcode == 0);
        var sender = this;
        this.mobile.check_login = function (appid, action, state) {
            if(!sender.mobile.user_islogin){
                switch(action){
                    case "json":
                        sender.restful(81006, null, appid, 'login');
                        break;
                    case "nodo":
                        break;
                    case "redirect":
                    default:
                        sender.redirect(sender.router.url('wx_mobile_vip_start_auth', appid) + "?state=" + state);
                        break;
                }
                return false;
            }else{
                return true;
            }
        };
        yield next;
    }catch (ex){
        this.mobile.user_islogin = false;
        yield next;
    }
};