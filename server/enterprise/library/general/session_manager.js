module.exports = function *(next) {
    try {
        var result = yield this.call(this.const.SDAP_API.ACCOUNT.ISLOGIN, {});
        if(result.errcode == 0){
            this.user_islogin = true;
            this.user_info = result.data;
        }else{
            this.user_islogin = false;
            this.user_info = null;
        }
        var sender = this;
        this.check_login = function (action) {
            if(!sender.user_islogin){
                switch(action){
                    case "json":
                        sender.restful(10006, null, null, 'login');
                        break;
                    case "redirect":
                        sender.redirect(sender.router.url('ent_account_login'));
                        break;
                    default:
                        break;
                }
                return false;
            }else{
                return true;
            }
        };
        yield next;
    }catch (ex){
        this.user_islogin = false;
        this.user_info = null;
        yield next;
    }
};