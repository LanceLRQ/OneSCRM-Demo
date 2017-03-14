module.exports = {
    get: function *(next){
        try {
            yield this.render(this.const.TEMPLATES.ACCOUNT.REGISTER);
        }catch (ex){
            this.body = ex
        }
    },
    post: function *(next){
        try  {

            if(this.user_islogin){
                this.restful(-10000);
                return;
            }
            var post_body = this.parse_post({
                username: "string",
                password: "string",
                repassword: "string"
            });
            if(post_body === false){
                this.restful(-10001); //提交内容无效或存在无法转换的格式
                return;
            }

            var phoneMatcher = /^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$/;
            if(!phoneMatcher.test(post_body.username)){
                this.restful(-10002); // 电话号码格式不匹配
                return;
            }
            if(post_body.password.length <= 6){
                this.restful(-10003); // 密码为空或太短
            }
            if(post_body.password != post_body.repassword){
                this.restful(-10004); // 密码和重复密码不匹配
                return;
            }
            var result = yield this.call(this.const.SDAP_API.ACCOUNT.REGISTER, {
                username: post_body.username,
                password: post_body.password,
                realname: ""
            });
            console.log(result);
            this.restful(result);

        }catch (ex){
            if(this.const.DEBUG) console.log(ex);
            this.restful(ex.errcode != undefined ? ex.errcode : -1);
        }
    }
};