module.exports = function *(next) {
    /**
     * RESTFul 消息返回模型
     * @param errcode   错误代码，0表示正常
     * @param errmsg    错误消息，如果为null则自动解析
     * @param data      数据交换
     * @param action    调用行为
     */
    var sender = this;
    this.restful = function (errcode, errmsg, data, action) {
        var _errcode = errcode;
        var _data = data;
        var _action = action;
        if(typeof errcode == 'object'){
            _errcode = errcode.errcode;
            _data = errcode.data;
            _action = errcode.action;
        }
        if(_errcode == undefined) _errcode = -1;
        if(_data == undefined) _data = null;
        if(_action == undefined) _action = null;
        var _errmsg = '';
        if(_errcode != 0 && (errmsg == undefined || errmsg == null)){
            _errmsg = sender.const.ERROR_MESSAGE[_errcode];
        }else{
            _errmsg = errmsg;
        }
        sender.body = {
            errcode: _errcode,
            errmsg: _errmsg,
            data: _data,
            action: _action
        }
    };
    yield next;
};