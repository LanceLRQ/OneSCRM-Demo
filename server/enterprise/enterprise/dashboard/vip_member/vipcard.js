module.exports = {
    index: {
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_CARD.INDEX)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    edit:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_CARD.EDIT)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        },
        post:function *(next) {
            try{
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.VIPCARD.INFO_GET, {
                    enterpriseId: this.params.eid
                });
                if(result.errcode != 0){
                    this.restful(result);
                    return;
                }
                var store_list = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.GET_ALL, {
                    enterpriseId: this.params.eid,
                });
                if(store_list.errcode != 0){
                    this.restful(store_list);
                    return;
                }
                this.restful(0, null,{
                    vipCardInfo: result.data,
                    storeList: store_list.data,
                    enterpriseInfo: this.enterprise.Info.enterpriseInfo
                })
                
            }catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        },
        save: function *(next) {
            try {

                var reqBody = this.request.body;

                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.VIPCARD.INFO_EDIT, {
                    enterpriseId:this.params.eid,
                    cardTitle:reqBody.cardTitle,
                    coverImg:reqBody.coverImg,
                    colorId:reqBody.colorId,
                    vipBenefit:reqBody.vipBenefit,
                    readMe:reqBody.readMe,
                    customerServicePhone:reqBody.customerServicePhone,
                    enterpriseId:reqBody.enterpriseId,
                    cardId:reqBody.cardId,
                    wxStatus:reqBody.wxStatus,
                    activeWay:reqBody.activeWay,
                    marketPrice:reqBody.marketPrice,
                    realPrice:reqBody.realPrice,
                    isPhone:reqBody.isPhone,
                    isPhoneNecessary:reqBody.isPhoneNecessary,
                    isName:reqBody.isName,
                    isNameNecessary:reqBody.isNameNecessary,
                    isSex:reqBody.isSex,
                    isSexNecessary:reqBody.isSexNecessary,
                    isBirthday:reqBody.isBirthday,
                    isBirthdayNecessary:reqBody.isBirthdayNecessary,
                    isMail:reqBody.isMail,
                    isMailNecessary:reqBody.isMailNecessary,
                    isAddress:reqBody.isAddress,
                    isAddressNecessary:reqBody.isAddressNecessary,
                    isIdcard:reqBody.isIdcard,
                    isIdcardNecessary:reqBody.isIdcardNecessary,
                    canRecharge:reqBody.canRecharge,
                    canConsume:reqBody.canConsume,
                    isWeixin:reqBody.isWeixin
                });
                this.restful(result);

            } catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        },
        
    },
    manage:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_CARD.MANAGE)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        },
        post:function *(next) {
            try{
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.VIPCARD.INFO_GET, {
                    enterpriseId: this.params.eid
                });
                if(result.errcode != 0){
                    this.restful(result);
                    return;
                }
                var store_list = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.GET_ALL, {
                    enterpriseId: this.params.eid
                });
                if(store_list.errcode != 0){
                    this.restful(store_list);
                    return;
                }
                this.restful(0, null,{
                    vipCardInfo: result.data,
                    storeList: store_list.data,
                    enterpriseInfo: this.enterprise.Info.enterpriseInfo
                })

            }catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        },
    }
    
};