module.exports = function(server){
    var router = server.middleware.router();
    
    var app = require('./enterprise');

    /* 商户账号部分 */
    router.get('ent_account_login', 'account/login',  app.account.login.get);
    router.post('ent_account_login_check', 'account/login/check', app.account.login.post);
    router.get('ent_account_register', 'account/register', app.account.register.get);
    router.post('ent_account_register_save', 'account/register/save', app.account.register.post);
    router.get('ent_account_space_enterprise_list', 'account/space/enterprise_list', app.account.space.enterprise_list.get);
    router.post('ent_account_space_enterprise_list', 'account/space/enterprise_list', app.account.space.enterprise_list.post);
    /* 商户管理面板 -- 详情模块 */
    router.get('ent_board_profile', ':eid/dashboard/profile', app.dashboard.profile.index.get);
    /* 商户管理面板 -- 设置模块 */
    router.get('ent_board_settings_info', ':eid/dashboard/settings/info', app.dashboard.settings.info.view.get);
    router.post('ent_board_settings_info', ':eid/dashboard/settings/info', app.dashboard.settings.info.view.post);
    router.post('ent_board_settings_info_save', ':eid/dashboard/settings/info/save', app.dashboard.settings.info.save);
    router.get('ent_board_settings_store_list', ':eid/dashboard/settings/store/list', app.dashboard.settings.store.list.get);
    router.post('ent_board_settings_store_list', ':eid/dashboard/settings/store/list', app.dashboard.settings.store.list.post);
    router.get('ent_board_settings_store_new', ':eid/dashboard/settings/store/new', app.dashboard.settings.store.new.get);
    router.post('ent_board_settings_store_new', ':eid/dashboard/settings/store/new', app.dashboard.settings.store.new.post);
    router.post('ent_board_settings_store_new_get_citys_list', ':eid/dashboard/settings/store/new/get/citys_list', app.dashboard.settings.store.new.citys_list);
    router.get('ent_board_settings_store_edit', ':eid/dashboard/settings/store/edit', app.dashboard.settings.store.edit.get);
    router.post('ent_board_settings_store_edit', ':eid/dashboard/settings/store/edit', app.dashboard.settings.store.edit.post);
    router.post('ent_board_settings_store_edit_save', ':eid/dashboard/settings/store/edit/save', app.dashboard.settings.store.edit.save);
    /* 商户管理面板 -- 会员模块 */
    router.get('ent_board_vip_member_vipcard', ':eid/dashboard/vip_member/vipcard/index', app.dashboard.vip_member.vipcard.index.get);
    router.get('ent_board_vip_member_vipcard_edit', ':eid/dashboard/vip_member/vipcard/edit', app.dashboard.vip_member.vipcard.edit.get);
    router.post('ent_board_vip_member_vipcard_edit', ':eid/dashboard/vip_member/vipcard/edit', app.dashboard.vip_member.vipcard.edit.post);
    router.post('ent_board_vip_member_vipcard_edit_save', ':eid/dashboard/vip_member/vipcard/edit/save', app.dashboard.vip_member.vipcard.edit.save);
    router.get('ent_board_vip_member_vipcard_manage', ':eid/dashboard/vip_member/vipcard/manage', app.dashboard.vip_member.vipcard.manage.get);
    router.post('ent_board_vip_member_vipcard_manage', ':eid/dashboard/vip_member/vipcard/manage', app.dashboard.vip_member.vipcard.manage.post);
    router.get('ent_board_vip_member_vipmanage', ':eid/dashboard/vip_member/vipmanage/list', app.dashboard.vip_member.vipmanage.list.get);
    router.post('ent_board_vip_member_vipmanage', ':eid/dashboard/vip_member/vipmanage/list', app.dashboard.vip_member.vipmanage.list.post);
    router.get('ent_board_vip_member_vipmanage_details', ':eid/dashboard/vip_member/vipmanage/details', app.dashboard.vip_member.vipmanage.details.get);
    router.get('ent_board_vip_member_vipmember_edit', ':eid/dashboard/vip_member/vipmember/edit', app.dashboard.vip_member.vipmember.edit.get);
    router.get('ent_board_vip_member_vipmember_recordsPay', ':eid/dashboard/vip_member/vipmember/recordsPay', app.dashboard.vip_member.vipmember.recordsPay.get);
    router.get('ent_board_vip_member_vipmember_recordsRech', ':eid/dashboard/vip_member/vipmember/recordsRech', app.dashboard.vip_member.vipmember.recordsRech.get);
    router.get('ent_board_vip_member_vipmember_recordsBuy', ':eid/dashboard/vip_member/vipmember/recordsBuy', app.dashboard.vip_member.vipmember.recordsBuy.get);
    router.get('ent_board_vip_member_vipmember_recordsInte', ':eid/dashboard/vip_member/vipmember/recordsInte', app.dashboard.vip_member.vipmember.recordsInte.get);
    router.get('ent_board_vip_member_vipmember_recordsCancel', ':eid/dashboard/vip_member/vipmember/recordsCancel', app.dashboard.vip_member.vipmember.recordsCancel.get);
    router.get('ent_board_vip_member_vipmember_recordsGift', ':eid/dashboard/vip_member/vipmember/recordsGift', app.dashboard.vip_member.vipmember.recordsGift.get);
    router.get('ent_board_vip_member_viplabel', ':eid/dashboard/vip_member/viplabel/manage', app.dashboard.vip_member.viplabel.manage.get);
    router.get('ent_board_vip_member_viplabel_divide', ':eid/dashboard/vip_member/viplabel/divide', app.dashboard.vip_member.viplabel.divide.get);
    router.get('ent_board_vip_member_viplabel_new', ':eid/dashboard/vip_member/viplabel/new', app.dashboard.vip_member.viplabel.new.get);
    router.get('ent_board_vip_member_viplevel', ':eid/dashboard/vip_member/viplevel/type', app.dashboard.vip_member.viplevel.type.get);
    router.get('ent_board_vip_member_viplevel_settings', ':eid/dashboard/vip_member/viplevel/settings', app.dashboard.vip_member.viplevel.settings.get);

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
    // 商家信息中间件
    router.use(server.library.enterprise.info_provider);
    // 注册微信接口通用交互中间件
    router.use(server.library.wechat.networkProvider);
    // 微信公众平台信息中间
    router.use(server.library.wechat.mpInfoProvider);

    return router;
};