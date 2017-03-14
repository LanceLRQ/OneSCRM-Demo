/**
 * Created by KingsWong on 16/9/22.
 */
module.exports = {
    type:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_LEVEL.TYPE)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    settings:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_LEVEL.SETTINGS)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
}