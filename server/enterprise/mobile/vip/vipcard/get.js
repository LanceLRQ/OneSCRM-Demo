/**
 * Created by solar on 16/9/3.
 */
module.exports = {
    view: function *(next) {
        try {
            var openid = this.params.openid;
            var appid = this.params.appid;
            var mpInfo = yield this.wechat.mpInfo(appid);
            if (!this.mobile.check_login(appid, null, 'mobile_vip_vipcard_get')) {
                return false;
            }
            yield this.render(this.const.TEMPLATES.VIP.VIPCARD.GET);

        }catch (ex){
            if(this.const.DEBUG) console.log(ex);
            yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -1);
        }
    },
    // do: function *(next) {
    //     var openid = this.params.openid;
    //     var appid = this.params.appid;
    //     var mpInfo = yield this.wechat.mpInfo(appid);
    //     if (!this.mobile.check_login(appid, null, 'mobile_vip_vipcard_get')) {
    //         return false;
    //     }
    //     try {
    //         var result = yield this.mobile.call(this.const.SDAP_API.MOBILE.VIP.VIP_CARD_GET, {
    //             wxOpenId: openid,
    //             enterpriseId: mpInfo.enterpriseId
    //         });
    //         if (result.errcode == 0) {
    //             this.redirect(this.router.url('mobile_vip_vip_write_info', appid, openid));
    //         } else {
    //             if(this.const.DEBUG) console.log(result);
    //             yield this.render_error_page(result.errcode != undefined ? result.errcode : -1);
    //         }
    //     } catch (ex) {
    //         if(this.const.DEBUG) console.log(ex);
    //         yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -1);
    //     }
    // }
};