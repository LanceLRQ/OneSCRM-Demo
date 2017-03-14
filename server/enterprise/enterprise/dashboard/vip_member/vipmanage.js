/**
 * Created by KingsWong on 16/9/6.
 */
module.exports = {
    list:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MANAGE.LIST);
            }catch (ex){
                this.render_error_page(-1);
            }
        },
        post:function *(next) {
            try {

                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.VIPMEMBER.VIP_GET, {
                    enterpriseId: this.params.eid,
                    page:'1',
                    limit:'10'
                });
                if(result.errcode != 0){
                    this.restful(result);
                    return;
                }

                this.restful(0, null, {
                    vipMemberInfo : result.data,
                    citys: this.const.CONST_CITYS
                })

            }catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        },
    },
    details:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MANAGE.DETAILS);
            }catch (ex){
                this.render_error_page(-1);
            }
        }
    }
}