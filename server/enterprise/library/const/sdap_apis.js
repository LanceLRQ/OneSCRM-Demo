module.exports = {
    ACCOUNT:{
        LOGIN_CHECK: "/account/login/check",
        ISLOGIN: "/account/login/islogin",
        REGISTER: "/account/register/check"
    },
    ENTERPRISE:{
        INFO: {
            GET: '/enterprise/info/get',
            GET_ALL: '/enterprise/info/get/all',
            ADD: "/enterprise/info/add",
            GET_TYPE: '/enterprise/type/get'
        },
        STORE: {
            GET_ALL: '/store/info/get/all',
            ADD: '/store/info/add',
            GET: '/store/info/get',
            EDIT: '/store/info/edit'
        },
        VIPCARD: {
            INFO_EDIT: '/vipcard/info/edit',
            INFO_GET:'/vipcard/info/get'
        },
        VIPMEMBER:{
            VIP_GET:'/enterprise/vip/get'
        }
    },
    MOBILE: {
        VIP: {
            LOGIN_CHECK: '/mobile/vip/login/check',
            VIP_CARD_GET: '/mobile/vip/card/get',
            GET_CARD_INFO: '/mobile/card/info/get',
            ISLOGIN: '/mobile/vip/login/islogin'
        }
    }
};