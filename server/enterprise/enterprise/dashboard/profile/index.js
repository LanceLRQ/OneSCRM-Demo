module.exports = {
    get: function *(next){
        if(!this.check_login()){
            yield this.render_login_req_page();
            return;
        }
        try {
            yield this.render(this.const.TEMPLATES.DASHBOARD.PROFILE.INDEX);
        }catch (ex){
            yield this.render_error_page(-1);
        }
    }
};