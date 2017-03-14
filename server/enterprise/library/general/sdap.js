/**
 * Simple Data Access Protocol
 * 基于HTTP的简单数据访问协议
 */
var superagent = require('superagent');
require('superagent-proxy')(superagent);

module.exports = function *(next) {
    var sender = this;
    /**
     * 简单数据访问协议
     * @param url   接口地址
     * @param data  交互发送数据
     * @param type  数据类型，支持'form'和'json'
     * @param timeout 接口访问超时时间，单位ms，默认10秒（10000ms)
     * @returns {Promise} 返回RESTful格式数据
     *                      flag: 访问情况
     */
    this.call =  function (url, data, type, timeout) {
        if(type == undefined) type = "form";
        if(timeout == undefined || typeof timeout != 'number') timeout = 10000;
        if(this.const.DEBUG && url != this.const.SDAP_API.ACCOUNT.ISLOGIN) console.log("[SDAP_API_REQ]" + url);
        return new Promise(function (resolve, reject) {
            try {
                var s = superagent
                    .post(sender.const.SDAP_ADDRESS + url)
                    .type(type)
                    .timeout(timeout);
                    if(sender.const.API_DEBUG)
                        s.proxy("http://127.0.0.1:8888");
                    s.set('Cookie', (sender.header.cookie != undefined) ? sender.header.cookie : "")
                    .send(data)
                    .end(function (err, res) {
                        try {
                            if (err == null) {
                                var set_cookie = res.header['set-cookie'];
                                if(set_cookie instanceof Array){
                                    sender.set("Set-Cookie", set_cookie);
                                }
                                resolve(JSON.parse(res.text));
                            } else {
                                if(err.response != undefined){
                                    if(sender.const.DEBUG) {
                                        console.log(err.response.header);
                                        console.log(err.response.text);
                                    }
                                    err.response = null;
                                }
                                var err_ent = new Error(sender.const.ERROR_MESSAGE['-2']);
                                err_ent.errcode = -2;
                                reject(err_ent);
                            }
                        } catch (ex) {
                            ex.errcode = -2;
                            reject(ex);
                        }
                    })

            }catch (ex) {
                ex.errcode = -2;
                reject(ex);
            }
        });
    };
    yield next;
};