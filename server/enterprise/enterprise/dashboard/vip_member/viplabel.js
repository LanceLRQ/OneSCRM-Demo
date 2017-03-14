/**
 * Created by KingsWong on 16/9/20.
 */
module.exports = {
    manage: {
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_LABEL.MANAGE)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    divide: {
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_LABEL.DIVIDE)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    new: {
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_LABEL.NEW)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
}