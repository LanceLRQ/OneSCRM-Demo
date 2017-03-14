module.exports = function *(next) {
    try {
        if(!this.check_login()){
            yield this.render_login_req_page();
            return false;
        }

        var result = yield this.wechat.api(this.const.WECHAT_API.COMPONENT_CREATE_PAC, {
            component_access_token: this.wechat.component.accessToken
        }, {
            component_appid: this.const.COMPONENT_APP_ID
        });

        if (result.pre_auth_code != undefined) {
            this.redirect(
                this.const.WECHAT_API.COMPONENT_LOGIN_PAGE +
                "?component_appid=" +
                this.const.COMPONENT_APP_ID +
                "&pre_auth_code="+
                result.pre_auth_code +
                "&redirect_uri="+ encodeURIComponent("http://" + this.const.DOMAIN + this.const.COMPONENT_AUTH_CALLBACK)
            )
        }else{
            if(this.const.DEBUG) console.log(result);
            yield this.render_error_page(-5);
            return false;
        }
    }catch(ex){
        if(this.const.DEBUG) console.log(ex);
        yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -5);
        return false;
    }
};