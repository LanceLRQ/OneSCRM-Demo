module.exports = function *(next) {
    try {
        this.wechat.component = null;
        
        var component_setting = yield this.model.WX_ComponentSetting.findOne({appID: this.const.COMPONENT_APP_ID}).exec();
        if (component_setting == null) {
            component_setting = new this.model.WX_ComponentSetting({
                appID: this.const.COMPONENT_APP_ID
            });
            yield component_setting.save();
        }
        if (component_setting.accessToken == undefined || ((component_setting.accessTokenExpiresIn - this.getSysTime()) < 100 )) {
            if (component_setting.verifyTicket != undefined) {
                var result = yield this.wechat.api(this.const.WECHAT_API.COMPONENT_TOKEN, {}, {
                    component_appid: this.const.COMPONENT_APP_ID,
                    component_appsecret: this.const.COMPONENT_APP_SECERT,
                    component_verify_ticket: component_setting.verifyTicket
                });
                if (result.component_access_token != undefined) {
                    component_setting.accessToken = result.component_access_token;
                    component_setting.accessTokenExpiresIn = this.getSysTime() + result.expires_in;
                    yield component_setting.save();
                } else {
                    component_setting.accessToken = "";
                    component_setting.accessTokenExpiresIn = 0;
                    yield component_setting.save();
                }
            }
        }
        this.wechat.component = component_setting;
        yield next;
    }catch(ex){
        if(this.const.DEBUG) console.log(ex);
        this.body = 'WeChat API Failed';
    }
};
