/**
 * Created by solar on 16/9/3.
 */

module.exports = {
    info:function *(next) {
        var openid = this.params.openid;
        var appid = this.params.appid;
        var mpInfo = this.wechat.mpInfo(appid);
        if(!this.mobile.check_login(appid, null, 'mobile_vip_vipcard_get')){
            return false;
        }
        try{
            // var infoToWrite = yield this.mobile.call(this.const.SDAP_API.MOBILE.VIP.GET_CARD_INFO, {
            //     wxOpenId: openid,
            //     enterpriseId: mpInfo.enterpriseId
            // });
            // if(infoToWrite.errcode != 0){
            //     yield this.render_error_page(infoToWrite.errcode);
            //     return;
            // }
            // var showFlag = true;
            // if (infoToWrite.isNameNecessary && isPhone){
            //     showFlag = false;
            // }
            yield this.render(this.const.TEMPLATES.VIP.VIP.WRITE_INFO, {
                //info: infoToWrite.data,
                info:{
                    isNameNecessary: true,
                    isPhone: true,
                    isBirthday: true,
                    isSex: true,
                    isMail: true,
                    isAddress: true,
                    isIdcard: true,
                },
                showFlag: true
            });

        }catch (ex) {
            if (this.const.DEBUG) console.log(ex);
            yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -1);
        }
    },


    save: function *(next) {
        var openid = this.params.openid;
        var appid = this.params.appid;
        var mpInfo = yield this.wechat.mpInfo(appid);
        if(!this.mobile.check_login(appid, null, 'mobile_vip_vipcard_get')){
            return false;
        }
        try{
            var data = this.request.body;
            var result = yield this.mobile.call(this.const.SDAP_API.MOBILE.VIP.VIP_CARD_GET,{
                memberName: data.memberName,
                phone: data.phone,
                sex:(data.sex == "Male") ?  1 : 2,
                email: data.email,
                address: data.address,
                idcardnumber: data.idcardnumber,
                birthday: data.birthday.replace(/-/g,'/'),
                wxOpenid: openid,
                enterpriseId: mpInfo.enterpriseId
            });

            if(result.errcode == 0){
                this.redirect("http://baidu.com");
            }else{
                yield this.render_error_page(result.errcode);
            }

        }catch(ex) {
            if (this.const.DEBUG) console.log(ex);
            yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -1);
        }
    }

};