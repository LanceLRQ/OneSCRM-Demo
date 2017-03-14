module.exports = {
    get: function *(next) {
        if(this.user_islogin){
            this.redirect(this.router.url('ent_account_space_enterprise_list'));
        }
        yield this.render(this.const.TEMPLATES.ACCOUNT.LOGIN);
    },
    post: function *(next) {
        try {

            var result = yield this.call(this.const.SDAP_API.ACCOUNT.LOGIN_CHECK, {
                username: this.request.body.username,
                password: this.request.body.password,
                rememberMe: (this.request.body.rememberMe != undefined) ? this.request.body.rememberMe : "0"
            });
            if (result.errcode == 0) {
                this.restful(0, null, this.router.url('ent_account_space_enterprise_list'), 'redirect');
            } else {
                this.restful(result.errcode);
            }

        } catch (ex) {
            if(this.const.DEBUG) console.log(ex);
            this.restful(ex.errcode != undefined ? ex.errcode : -1);
        }
        yield next;
    }
};