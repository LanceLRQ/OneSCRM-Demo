/**
 * Created by lancelrq on 16/9/12.
 */

module.exports = function *(next) {
    var appid = this.params.appid;
    var mpinfo = yield this.wechat.mpInfo(appid, true);
    if(mpinfo === null){
        yield this.render_error_page(-5);
        return;
    }
    if(mpinfo !== false){
        this.body = yield this.wechat.api(this.const.WECHAT_API.MENU.CREATE, {
            access_token: mpinfo.authorization_info.accessToken
        }, '{"button": [{"type": "view","name": "商家首页","url":"http://www.onescrm.com/"},{"name": "会员中心","sub_button": [{"type": "click","name": "领取会员卡","key":"VIP_BIND_CARD"}]}]}');
    }else{
        yield this.render_error_page(-6);
    }
};