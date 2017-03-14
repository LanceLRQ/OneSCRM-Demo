module.exports = {
    get: function *(next) {
        if(!this.check_login()){
            yield this.render_login_req_page();
            return;
        }
        yield this.render(this.const.TEMPLATES.ACCOUNT.SPACE.ENTERPRISE_LIST);
    },
    post: function *(next) {
        if(!this.check_login('json')){
            return false;
        }
        try {
            var result = yield this.call(this.const.SDAP_API.ENTERPRISE.INFO.GET_ALL, {});
            this.restful(result);
        }
        catch (ex) {
            if(this.const.DEBUG) console.log(ex);
            this.restful(ex.errcode != undefined ? ex.errcode : -1);
        }

    }
    
};