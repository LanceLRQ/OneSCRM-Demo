module.exports = function *(next) {
    /**
     * 渲染错误页面
     * @param errcode   错误代码，与RESTful中间件共享错误数据常量，0表示正常（请勿使用）
     * @param errmsg    错误消息
     * @param action    页面行为（支持参数'redirect'（跳转到params.redirect_url指定地址）和'back'（后退一步，默认值）
     * @param params    参数列表:
     *                  params.duration 页面执行动作的时延，默认值为5秒
     *                  params.redirect_url 页面跳转地址
     */
    var sender = this;
    this.render_error_page = function (errcode, errmsg, action, params) {
        var _errcode = errcode;
        var _params = params;
        var _action = action;
        if(typeof errcode == 'object'){
            _errcode = errcode.errcode;
        }
        if(_errcode == undefined) _errcode = -1;
        if(_params == undefined) _params = {duration: 5000, redirect_url: '', color: 'danger'};
        if(_action == undefined) _action = 'back';
        var _errmsg = '';
        if(_errcode != 0 && (errmsg == undefined || errmsg == null)){
            _errmsg = sender.const.ERROR_MESSAGE[_errcode];
        }else{
            _errmsg = errmsg;
        }
        return sender.render('error_page', {
            errcode: _errcode,
            errmsg: _errmsg,
            action: _action,
            eparam: _params
        });
    };
    this.render_login_req_page = function () {
        return this.render_error_page(10006, null, 'redirect', {
            duration: 5000,
            redirect_url: this.router.url('ent_account_login'),
            color: 'danger'
        });
    };
    yield next;
};