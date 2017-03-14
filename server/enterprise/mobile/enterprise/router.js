module.exports = function(server){
    var router = server.middleware.router();

    var app = require('./enterprise');

    //商家版
    //商家账号
    router.get('mobile_enterprise_account_binding_identity_verification', ':appid/account_binding/identity_verification', app.account_binding.identity_verification);
    router.get('mobile_enterprise_account_binding_shop_helper', ':appid/account_binding/shop_helper', app.account_binding.shop_helper);
    //交易
    router.get('mobile_enterprise_deal_deal_detail', ':appid/deal/deal_detail', app.deal.deal_detail);
    router.get('mobile_enterprise_deal_deal_record', ':appid/deal/deal_record', app.deal.deal_record);
    //我的门店
    router.get('mobile_enterprise_my_shop_my_shop', ':appid/my_shop/my_shop', app.my_shop.my_shop);
    //扫码搜索
    router.get('mobile_enterprise_scan_searching_scan', ':appid/scan_searching/scan', app.scan_searching.scan);
    router.get('mobile_enterprise_scan_searching_scan_result', ':appid/scan_searching/scan_result', app.scan_searching.scan_result);
    //核销
    router.get('mobile_enterprise_write_off_enter_code', ':appid/write_off/enter_code', app.write_off.enter_code);
    router.get('mobile_enterprise_write_off_scan', ':appid/write_off/scan', app.write_off.scan);
    router.get('mobile_enterprise_write_off_write_off', ':appid/write_off/write_off', app.write_off.write_off);
    router.get('mobile_enterprise_write_off_write_off_detail', ':appid/write_off/write_off_detail', app.write_off.write_off_detail);
    router.get('mobile_enterprise_write_off_write_off_record', ':appid/write_off/write_off_record', app.write_off.write_off_record);
    router.get('mobile_enterprise_write_off_write_off_result', ':appid/write_off/write_off_result', app.write_off.write_off_result);


    // 注册简单数据访问协议中间件
    router.use(server.library.general.simple_data_access_protocol);
    // RESTful 信息反馈中间件
    router.use(server.library.general.restful);
    // 注册模板渲染器到上下文
    router.use(server.library.general.render(server));
    // 注册post数据解析
    router.use(server.middleware.postbody());
    // 注册post表单验证转义中间件
    router.use(server.library.general.parse_post);
    // 注册登录信息获取中间件
    router.use(server.library.general.session_manager);
    // 错误页中间件
    router.use(server.library.general.error_page);


    return router;
};