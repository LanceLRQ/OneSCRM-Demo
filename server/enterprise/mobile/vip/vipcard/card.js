/**
 * Created by solar on 16/9/3.
 */
module.exports = function *(next) {
    var openid = this.params.openid;
    var appid = this.params.appid;
    var enterpriseid = this.mpInfo(appid);
    if(!this.mobile.check_login(appid, null, 'mobile_vip_vipcard_get')){
        return false;
    }
    try{
        var cardInfo = yield this.call(this.const.SDAP_API.MOBILE.VIP.GET_CARD_INFO, {
            wxOpenId: openid,
            enterpriseId: mpInfo.enterpriseId
        });
        // var vipInfo = yield this.call(this.const.SDAP_API.MOBILE.VIP.GET_VIP_INFO, {
        //     vipLevel:vipInfo.vipLevel,
        //     vipCredit:vipInfo.vipCredit,
        //     vipBalance:vipInfo.vipBalance
        // })
        if(cardInfo.errcode != 0){
            yield this.render_error_page(cardInfo.errcode);
            return;
        }

        yield this.render(this.const.TEMPLATES.VIP.VIPCARD.CARD,{
            cardInfo: cardInfo
            // vipInfo:vipInfo
        });
        
    }catch (ex){
        
    }

};