/**
 * Created by lancelrq on 16/8/31.
 */
module.exports = {
    list: {
        get: function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.SETTINGS.STORE_LIST);
            }catch (ex){
                yield this.render_error_page(-1);
            }
        },
        post: function *(next) {
            try {

                // 获取门店列表信息
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.GET_ALL, {
                    enterpriseId: this.params.eid
                });
                this.restful(result);

            } catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        }
    },
    new: {
        get: function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.SETTINGS.STORE_EDIT, {
                    view_action: 'new'
                });
            }catch (ex){
                yield this.render_error_page(-1);
            }
        },
        citys_list: function *(next) {
            this.restful(0, null, this.const.CONST_CITYS);
        },
        post: function *(next) {
            try {

                var reqBody = this.request.body;
                reqBody.enterpriseId = this.params.eid;
                var enterpriseInfo = this.enterprise.Info.enterpriseInfo;

                // 执行添加门店操作
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.ADD, reqBody);
                if(result.errcode == 0){

                    var sid = result.data;
                    if(reqBody.wxSync){
                        //调用微信接口，发送新建请求
                        var mpInfo = yield this.wechat.mpInfoByEntId(this.params.eid);
                        var wxrel = yield this.wechat.api(this.const.WECHAT_API.POI.ADDPOI,{
                            access_token: mpInfo.authorization_info.accessToken
                        }, {
                            business: {
                                base_info: {
                                    business_name: enterpriseInfo.enterpriseName,
                                    branch_name: reqBody.storeName,
                                    province: reqBody.province,
                                    city: reqBody.city,
                                    district: reqBody.district,
                                    address: reqBody.address,
                                    telephone: reqBody.contactPhone,
                                    categories: [enterpriseInfo.type1 + "," + enterpriseInfo.type2],
                                    offset_type: 1,
                                    longitude: reqBody.longitude,
                                    latitude: reqBody.latitude
                                }
                            }
                        });
                        if(wxrel.errcode == 0){
                            yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.EDIT, {
                                wxStoreStatus: 0
                            });
                            this.restful(0);
                        }else{
                            this.restful(-3);
                        }
                    }else{
                        yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.EDIT, {
                            wxStoreStatus: -1
                        });
                    }
                }else{
                    this.restful(result);
                }
            } catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        }
    },
    edit: {
        get: function *(next) {
            var store_id = this.query.store_id;
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.SETTINGS.STORE_EDIT, {
                    view_action: 'modify',
                    store_id: store_id
                });
            }catch (ex){
                yield this.render_error_page(-1);
            }
        },
        save: function *(next) {
            try {

                var reqBody = this.request.body;
                reqBody.enterpriseId = this.params.eid;

                var rawData = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.GET, {
                    enterpriseId: this.params.eid,
                    storeId: reqBody.id
                });
                if(rawData.errcode != 0){
                    this.restful(result);
                    return;
                }
                if(rawData.wxStoreStatus == 0 || rawData.wxStoreStatus == 3){
                    this.restful(-7);
                    return;
                }
                if(reqBody.wxSync){
                    reqBody.wxStoreStatus = 3;
                    //调用微信接口，发送修改请求
                }else{
                    reqBody.wxStoreStatus = -1;
                }
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.EDIT, reqBody);
                this.restful(result);

            } catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        },
        post: function *(next) {
            try{
                var store_id = this.query.store_id;
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.STORE.GET, {
                    enterpriseId: this.params.eid,
                    storeId: store_id
                });
                if(result.errcode == 0){
                    this.restful(result.errcode, null, {
                        citys: this.const.CONST_CITYS,
                        entInfo: result.data
                    });
                }else{
                    this.restful(result);
                }

            } catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        }
    }
};