module.exports = function *(next) {
    this.enterprise.Info = null;
    if(!this.user_islogin){
        yield next;
        return;
    }
    var eid = this.params.eid;
    if (eid==undefined){
        yield next;
        return;
    }
    eid = parseInt(eid);
    if(isNaN(eid)){
        this.body = "ERROR";
        return;
    }
    var einfo = yield this.model.EnterpriseInfo.findOne({
        accountId: this.user_info.id,
        enterpriseId: eid
    }).exec();
    // 如果不存在缓存记录
    if (einfo == null) {
        var result = yield this.call(this.const.SDAP_API.ENTERPRISE.INFO.GET, {
            enterpriseId: this.params.eid
        });

        if (result.errcode == 0) {
            einfo = new this.model.EnterpriseInfo({
                accountId: this.user_info.id,
                enterpriseId: eid,
                enterpriseInfo: result.data
            });
            einfo.save();
        } else {
            yield next;
            return;
        }
    }
    this.enterprise.Info = einfo;
    var sender = this;
    this.enterprise.Info.refresh = function *(){
        var result = yield sender.call(sender.const.SDAP_API.ENTERPRISE.INFO.GET, {
            enterpriseId: sender.params.eid
        });
        if(result.errcode == 0){
            einfo.accountId = sender.user_info.id;
            einfo.enterpriseId = sender.params.id;
            einfo.enterpriseInfo = result.data;
            einfo.save();
            return true;
        }
        return false;
    };
    yield next;
};