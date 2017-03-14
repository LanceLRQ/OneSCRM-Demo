module.exports = function *(next) {
    var auth_code = this.query.auth_code;
    var uid = this.user_info.id;

    if (auth_code == undefined) {
        this.body = "ERROR";
    }
    try {
        var result = yield this.wechat.api(this.const.WECHAT_API.COMPONENT_ACCESS_TOKEN, {
            component_access_token: this.wechat.component.accessToken
        }, {
            component_appid: this.const.COMPONENT_APP_ID,
            authorization_code: auth_code
        });
        if (result.authorization_info != undefined) {
            var cinfo = yield this.model.WX_ComponentInfo.findOne({appID: result.authorization_info.authorizer_appid}).exec();
            if (cinfo == null) {
                cinfo = this.model.WX_ComponentInfo({
                    userID: uid,
                    appID: result.authorization_info.authorizer_appid,
                    authed: false
                });
                cinfo.save();
            } else {

                if (cinfo.userID != uid) {
                    this.body = "抱歉，该公众号已经授权过其他的账号";
                    return false;
                }else{
                    this.body = "请不要重复授权";
                    return false;
                }

            }
            cinfo.authed = true;
            cinfo.authorization_info.accessToken = result.authorization_info.authorizer_access_token;
            cinfo.authorization_info.accessTokenExpiresIn = result.authorization_info.expires_in + this.getSysTime();
            cinfo.authorization_info.refreshToken = result.authorization_info.authorizer_refresh_token;
            cinfo.authorization_info.func_info = JSON.stringify(result.authorization_info.func_info);
            cinfo.save();
            var result_info = yield this.wechat.api(this.const.WECHAT_API.COMPONENT_GET_AUTHORIZER_INFO, {
                component_access_token: this.wechat.component.accessToken
            }, {
                component_appid: this.const.COMPONENT_APP_ID,
                authorizer_appid: result.authorization_info.authorizer_appid
            });
            if (result_info.authorizer_info != undefined) {
                cinfo.authorizer_info.nick_name = result_info.authorizer_info.nick_name;
                cinfo.authorizer_info.head_img = result_info.authorizer_info.head_img;
                cinfo.authorizer_info.service_type_info = result_info.authorizer_info.service_type_info.id;
                cinfo.authorizer_info.verify_type_info = result_info.authorizer_info.verify_type_info.id;
                cinfo.authorizer_info.user_name = result_info.authorizer_info.user_name;
                cinfo.authorizer_info.alias = result_info.authorizer_info.alias;
                cinfo.authorizer_info.business_info = JSON.stringify(result_info.authorizer_info.business_info);
                cinfo.authorizer_info.qrcode_url = result_info.qrcode_url;
                cinfo.save();
            }else{
                if(this.const.DEBUG) console.log(result_info);
                yield this.render_error_page(-5);
                return false;
            }
            var addEnt = yield this.call(this.const.SDAP_API.ENTERPRISE.INFO.ADD, {
                wxAppId: result.authorization_info.authorizer_appid,
                enterpriseName: result_info.authorizer_info.nick_name,
                logoUrl: result_info.authorizer_info.head_img
            });
            if(addEnt.errcode == 0){
                cinfo.enterpriseId = addEnt.data.enterpriseId;
                cinfo.save();
                yield this.render_error_page(-10086, '授权成功！创建商户成功。', 'redirect', {
                    duration: 5000,
                    redirect_url: this.router.url('ent_account_space_enterprise_list'),
                    color: 'success'
                });
            }else{
                yield this.render_error_page(-10010, '授权成功！创建商户失败');
            }

        }else{
            if(this.const.DEBUG) console.log(result);
            yield this.render_error_page(-5);
            return false;
        }
    } catch (ex) {
        if(this.const.DEBUG) console.log(ex);
        yield this.render_error_page(ex.errcode != undefined ? ex.errcode : -5);
        return false;
    }
};