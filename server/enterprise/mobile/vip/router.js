module.exports = function(server){
    var router = server.middleware.router();

    var app = require('./vip');

    //会员版
    //会员卡
    router.get('mobile_vip_vipcard_get', ':appid/:openid/vipcard/get', app.vipcard.get.view);
    router.get('mobile_vip_vipcard_card', ':appid/:openid/vipcard/card', app.vipcard.card);
    //会员中心
    router.get('mobile_vip_vip_write_info', ':appid/:openid/vip/write_info' ,app.vip.write_info);
    router.post('mobile_vip_vip_write_info_save', ':appid/:openid/vip/write_info/save', app.vip.write_info_save);
    router.get('mobile_vip_vip_pay', ':appid/vip/pay', app.vip.pay);
    router.get('mobile_vip_vip_notice', ':appid/vip/notice', app.vip.notice);
    router.get('mobile_vip_vip_invite', ':appid/vip/invite', app.vip.invite);
    router.get('mobile_vip_vip_invite_record', ':appid/vip/invite_record', app.vip.invite_record);
    router.get('mobile_vip_vip_recharge', ':appid/vip/recharge', app.vip.recharge);
    router.get('mobile_vip_vip_balance', ':appid/vip/balance', app.vip.balance);
    router.get('mobile_vip_vip_recharge_guide',':appid/vip/recharge_guide', app.vip.recharge_guide);
    router.get('mobile_vip_vip_rights', ':appid/vip/rights', app.vip.rights);
    //卡券
    router.get('mobile_vip_cards_and_coupons_applicable_store', ':appid/cards_and_coupons/applicable_store', app.cards_and_coupons.applicable_store);
    router.get('mobile_vip_cards_and_coupons_use', ':appid/cards_and_coupons/use', app.cards_and_coupons.use);
    router.get('mobile_vip_cards_and_coupons_details', ':appid/cards_and_coupons/details', app.cards_and_coupons.details);
    router.get('mobile_vip_cards_and_coupons_soon_to_expire', ':appid/cards_and_coupons/soon_to_expire', app.cards_and_coupons.soon_to_expire);
    router.get('mobile_vip_cards_and_coupons_write_off', ':appid/cards_and_coupons/write_off', app.cards_and_coupons.write_off);
    router.get('mobile_vip_cards_and_coupons_cards_and_coupons', ':appid/cards_and_coupons/cards_and_coupons', app.cards_and_coupons.cards_and_coupons);
    //奖品
    router.get('mobile_vip_prize_write_off', ':appid/prize/write_off', app.prize.write_off);
    router.get('mobile_vip_prize_prize', ':appid/prize/prize', app.prize.prize);
    //等级
    router.get('mobile_vip_level_level', ':appid/level/level', app.level.level);
    router.get('mobile_vip_level_guide', ':appid/level/guide', app.level.guide);
    //积分
    router.get('mobile_vip_credit_credit', ':appid/credit/credit', app.credit.credit);
    router.get('mobile_vip_credit_guide', ':appid/credit/guide', app.credit.guide);
    router.get('mobile_vip_credit_exchange', ':appid/credit/exchange' ,app.credit.exchange);
    router.get('mobile_vip_credit_exchange_items', ':appid/credit/exchange_items', app.credit.exchange_items);
    //福利
    router.get('mobile_vip_welfare_welfare', ':appid/welfare/welfare', app.welfare.welfare);
    router.get('mobile_vip_welfare_coupons', ':appid/welfare/coupons', app.welfare.coupons);
    router.get('mobile_vip_welfare_coupon_get', ':appid/welfare/coupon_get', app.welfare.coupon_get);
    router.get('mobile_vip_welfare_cards', ':appid/welfare/cards', app.welfare.cards);
    router.get('mobile_vip_welfare_card_get', ':appid/welfare/card_get', app.welfare.card_get);
    router.get('mobile_vip_welfare_activity', ':appid/welfare/activity', app.welfare.activity);
    router.get('mobile_vip_welfare_lucky_draw', ':appid/welfare/lucky_draw', app.welfare.lucky_draw);


    // 注册简单数据访问协议中间件
    router.use(server.library.general.simple_data_access_protocol);
    router.use(server.library.mobile.sdap_mobile);

    // RESTful 信息反馈中间件
    router.use(server.library.general.restful);
    // 注册模板渲染器到上下文
    router.use(server.library.general.render(server));
    // 注册post数据解析
    router.use(server.middleware.postbody());
    // 注册post表单验证转义中间件
    router.use(server.library.general.parse_post);
    // 错误页中间件
    router.use(server.library.general.error_page);
    // 微信公众平台信息中间
    router.use(server.library.wechat.mpInfoProvider);
    // 登录信息获取中间件
    router.use(server.library.mobile.session_manager);

    return router;
};