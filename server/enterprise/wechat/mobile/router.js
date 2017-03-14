
module.exports = function(server){
    var router = server.middleware.router();
    var app = require('./mobile');

    // post数据解析器中间件
    var postBody = server.middleware.postbody;
    var wechatEnable = server.library.wechat.wechat_enable;

    router.get('wx_mobile_vip_start_auth', 'component/mobile/vip/:appid/auth/start', app.vip.start_auth);
    router.get('wx_mobile_vip_auth_callback', 'component/mobile/vip/:appid/auth/callback', app.vip.auth_callback);


    // 注册简单数据访问协议中间件
    router.use(server.library.general.simple_data_access_protocol);
    router.use(server.library.mobile.sdap_mobile);
    // RESTful 信息反馈中间件
    router.use(server.library.general.restful);
    // 注册模板渲染器到上下文
    router.use(server.library.general.render(server));
    // 注册post表单验证转义中间件（只注册不用也行）
    router.use(server.library.general.parse_post);
    // 错误页中间件
    router.use(server.library.general.error_page);
    // 注册微信接口通用交互中间件
    router.use(server.library.wechat.networkProvider);
    // 注册微信第三方平台配置信息中间件
    router.use(server.library.wechat.csettingProvider);
    // 微信的消息处理中间件
    router.use(server.library.wechat.msgBaseProvider);
    // 微信的消息验证中间件
    router.use(server.library.wechat.signatureProvider);
    // 注册微信被动回复消息生成器中间件
    router.use(server.library.wechat.msg_response);
    // 微信公众平台信息中间
    router.use(server.library.wechat.mpInfoProvider);


    return router;
};