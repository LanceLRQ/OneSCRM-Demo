module.exports = {
    view: {
        get: function *(next) {
            if(!this.check_login()){
                yield this.render_login_req_page();
                return;
            }
            try {
                yield this.render(this.const.TEMPLATES.DASHBOARD.SETTINGS.INFO)
            }catch (ex){
                yield this.render_error_page(-1);
            }
        },
        post: function *(next) {
            try {
                
                // 调用商家信息获取接口
                var result = yield this.call(this.const.SDAP_API.ENTERPRISE.INFO.GET, {
                    enterpriseId: this.params.eid
                });
                if(result.errcode != 0){
                    this.restful(result);
                    return;
                }
                
                // 处理类型列表的数据（读取，解析，处理）
                var type_result = yield this.call(this.const.SDAP_API.ENTERPRISE.INFO.GET_TYPE, {});
                if(type_result.errcode == 0){
                    type_result = type_result.data
                }else{
                    type_result = {}
                }
                var lv1_result = [];
                var lv2_result = {};
                for(key in type_result){
                    lv1_result.push(type_result[key]['name']);
                    var lists = [];
                    for(key2 in type_result[key]){
                        lists.push(type_result[key][key2]);
                    }
                    lv2_result[type_result[key]['name']] = lists;
                }
                
                this.restful(0, null, {
                    entInfo: result.data,
                    type1Selectors: lv1_result,
                    type2Selectors: lv2_result,
                    citys: this.const.CONST_CITYS
                })

            }catch (ex){
                if(this.const.DEBUG) console.log(ex);
                this.restful(ex.errcode != undefined ? ex.errcode : -1);
            }
        }
    },
    save: function *(next) {

        var reqBody = this.request.body;
        reqBody.enterpriseId = this.params.eid;

        if(!this.check_login('json')){
            return;
        }
        try {
            var result = yield this.call('/enterprise/info/edit', reqBody);
            if(result.errcode == 0) {
                if(this.enterpriseInfo != null) this.enterpriseInfo.refresh();
            }
            this.restful(result);
        }catch (ex){
            if(this.const.DEBUG) console.log(ex);
            this.restful(ex.errcode != undefined ? ex.errcode : -1);
        }
    }
};