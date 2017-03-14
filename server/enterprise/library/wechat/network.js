var superagent = require('superagent');

module.exports = function *(next) {
    var sender = this;
    this.wechat.api =  function (url, query, data, type, timeout) {
        if(type == undefined) type = "json";
        if(timeout == undefined || typeof timeout != 'number') timeout = 5000;
        return new Promise(function (resolve, reject) {
            try {
                superagent
                    .post(url)
                    .query(query)
                    .type(type)
                    .timeout(timeout)
                    .send(data)
                    .end(function (err, res) {
                        try {
                            if (err == null) {
                                var result = JSON.parse(res.text);
                                if(result.errcode != undefined && result.errcode !=0){
                                    if(sender.const.DEBUG) {
                                        console.log(result);
                                    }
                                    var err_ent = new Error(sender.const.ERROR_MESSAGE['-3']);
                                    err_ent.errcode = -3;
                                    err_ent.trace = result;
                                    reject(err_ent);
                                }else{
                                    resolve(result);
                                }
                            } else {
                                if(err.response != undefined){
                                    if(sender.const.DEBUG) {
                                        console.log(err.response.header);
                                        console.log(err.response.text);
                                    }
                                    err.response = null;
                                }
                                var err_ent = new Error(sender.const.ERROR_MESSAGE['-3']);
                                err_ent.errcode = -3;
                                err_ent.trace = err;
                                reject(err_ent);
                            }
                        } catch (ex) {
                            ex.errcode = -3;
                            reject(ex);
                        }
                    })

            }catch (ex) {
                ex.errcode = -3;
                reject(ex);
            }
        });
    };
    yield next;
};