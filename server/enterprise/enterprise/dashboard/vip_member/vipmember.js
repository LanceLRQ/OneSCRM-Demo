/**
 * Created by KingsWong on 16/9/19.
 */
module.exports = {
    edit:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.EDIT);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    recordsPay:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.RECORDSPAY);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    recordsRech:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.RECORDSRECH);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    recordsBuy:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.RECORDSBUY);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    recordsInte:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.RECORDSINTE);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    recordsCancel:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.RECORDSCANCEL);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    },
    recordsGift:{
        get:function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.VIP_MEMBER.VIP_MEMBER.RECORDSGIFT);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        }
    }
}