/**
 * Created by lancelrq on 16/9/12.
 */

module.exports = function *(next) {
    "use strict";

    let sender = this;
    this.wechat.mpInfo  = function *(appid, refreshToken) {
        try {
            if (refreshToken==undefined) refreshToken = false;
            var cinfo = yield sender.model.WX_ComponentInfo.findOne({appID: appid}).exec();
            if (cinfo == null) return null;
            if (refreshToken && cinfo.authorization_info.accessTokenExpiresIn <= sender.getSysTime()) {
                //如果AccessToken过期了
                var result = yield sender.wechat.api(sender.const.WECHAT_API.COMPONENT_GET_AUTHORIZER_TOKEN, {
                    component_access_token: sender.wechat.component.accessToken
                }, {
                    component_appid: sender.const.COMPONENT_APP_ID,
                    authorizer_appid: appid,
                    authorizer_refresh_token: cinfo.authorization_info.refreshToken
                });
                cinfo.authorization_info.accessToken = result.authorizer_access_token;
                cinfo.authorization_info.accessTokenExpiresIn = result.expires_in + sender.getSysTime();
                cinfo.authorization_info.refreshToken = result.authorizer_refresh_token;
                yield cinfo.save();
            }
            return cinfo;
        }catch (ex){
            if(sender.const.DEBUG) console.log(ex);
            if(ex.trace != null && ex.trace.errcode == 42002) return false; else return null;
        }
    };
    this.wechat.mpInfoByEntId  = function *(entId, refreshToken) {
        try {
            if (refreshToken==undefined) refreshToken = false;
            var cinfo = yield sender.model.WX_ComponentInfo.findOne({enterpriseId: entId}).exec();
            if (cinfo == null) return null;
            if (refreshToken && cinfo.authorization_info.accessTokenExpiresIn <= sender.getSysTime()) {
                //如果AccessToken过期了
                var result = yield sender.wechat.api(sender.const.WECHAT_API.COMPONENT_GET_AUTHORIZER_TOKEN, {
                    component_access_token: sender.wechat.component.accessToken
                }, {
                    component_appid: sender.const.COMPONENT_APP_ID,
                    authorizer_appid: appid,
                    authorizer_refresh_token: cinfo.authorization_info.refreshToken
                });
                cinfo.authorization_info.accessToken = result.authorizer_access_token;
                cinfo.authorization_info.accessTokenExpiresIn = result.expires_in + sender.getSysTime();
                cinfo.authorization_info.refreshToken = result.authorizer_refresh_token;
                yield cinfo.save();
            }
            return cinfo;
        }catch (ex){
            if(sender.const.DEBUG) console.log(ex);
            if(ex.trace != null && ex.trace.errcode == 42002) return false; else return null;
        }
    };
    yield next;
};