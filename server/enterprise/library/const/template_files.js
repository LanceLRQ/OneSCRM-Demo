module.exports = {
    // 商家PC端账号模块
    ACCOUNT:{
        LOGIN: "account/login",
        REGISTER: "account/register",
        SPACE: {
            ENTERPRISE_LIST: "account/space/enterprise_list"
        }
    },
    // 商家端控制面板模块
    DASHBOARD:{
        PROFILE: {
            INDEX: 'dashboard/profile/index'
        },
        SETTINGS:{
            INFO: "dashboard/settings/info",
            STORE_LIST: "dashboard/settings/store_list",
            STORE_EDIT: "dashboard/settings/store_edit",
        },
        VIP_MEMBER:{
            VIP_CARD: {
                INDEX:"dashboard/vip_member/vipcard_index",
                EDIT:"dashboard/vip_member/vipcard_edit",
                MANAGE:"dashboard/vip_member/vipcard_manage"
            },
            VIP_MANAGE:{
                LIST:"dashboard/vip_member/vipmanage_list",
                DETAILS:"dashboard/vip_member/vipmanage_details"
            },
            VIP_MEMBER:{
                EDIT:"dashboard/vip_member/vipmember_edit",
                RECORDSPAY:"dashboard/vip_member/vipmember_recordsPay",
                RECORDSRECH:"dashboard/vip_member/vipmember_recordsRech",
                RECORDSBUY:"dashboard/vip_member/vipmember_recordsBuy",
                RECORDSINTE:"dashboard/vip_member/vipmember_recordsInte",
                RECORDSCANCEL:"dashboard/vip_member/vipmember_recordsCancel",
                RECORDSGIFT:"dashboard/vip_member/vipmember_recordsGift",
            },
            VIP_LABEL:{
                MANAGE:"dashboard/vip_member/viplabel_manage",
                DIVIDE:"dashboard/vip_member/viplabel_divide",
                NEW:"dashboard/vip_member/viplabel_new",
            },
            VIP_LEVEL:{
                TYPE:"dashboard/vip_member/viplevel_type",
                SETTINGS:"dashboard/vip_member/viplevel_settings",
            }
        }
    },
    // 移动端会员模块
    VIP: {
        CARDS_AND_COUPONS: {
            APPLICABLE_STORE: "mobile/vip/cards_and_coupons/applicable_store",
            CARDS_AND_COUPONS: "mobile/vip/cards_and_coupons/cards_and_coupons",
            DETAILS: "mobile/vip/cards_and_coupons/details",
            SOON_TO_EXPIRE: "mobile/vip/cards_and_coupons/soon_to_expire",
            USE: "mobile/vip/cards_and_coupons/use",
            WRITE_OFF: "mobile/vip/cards_and_coupons/write_off"
        },
        CREDIT: {
            CREDIT: "mobile/vip/credit/credit",
            EXCHANGE: "mobile/vip/credit/exchange",
            EXCHANGE_ITEMS: "mobile/vip/credit/exchange_items",
            GUIDE: "mobile/vip/credit/guide"
        },
        LEVEL: {
            GUIDE: "mobile/vip/level/guide",
            LEVEL: "mobile/vip/level/level"
        },
        PRIZE: {
            PRIZE: "mobile/vip/prize/prize",
            WRITE_OFF: "mobile/vip/prize_write_off"
        },
        VIP:{
            BALANCE: "mobile/vip/vip/balance",
            INVITE: "mobile/vip/vip/invite",
            INVITE_RECORD: "mobile/vip/vip/invite_record",
            NOTICE: "mobile/vip/vip/notice",
            PAY: "mobile/vip/vip/pay",
            RECHARGE: "mobile/vip/vip/recharge",
            RECHARGE_GUIDE: "mobile/vip/vip/recharge_guide",
            RIGHTS: "mobile/vip/vip/rights",
            WRITE_INFO: "mobile/vip/vip/write_info"
        },
        VIPCARD: {
            CARD: "mobile/vip/vipcard/card",
            GET: "mobile/vip/vipcard/get"
        },
        WELFARE: {
            ACTIVITY: "mobile/vip/welfare/activity",
            CARD_GET: "mobile/vip/welfare/card_get",
            CARDS: "mobile/vip/welfare/cards",
            COUPON_GET: "mobile/vip/welfare/coupon_get",
            COUPONS: "mobile/vip/welfare/coupons",
            LUCKY_DRAW: "mobile/vip/welfare/lucky_draw",
            WELFARE: "mobile/vip/welfare/welfare"
        }
    },
    // 移动端商家模块
    ENTERPRISE: {
        ACCOUNT_BINDING: {
            IDENTITY_VERIFICATION: "mobile/enterprise/account_binding/identity_verification",
            SHOP_HELPER: "mobile/enterprise/account_binding/shop_helper"
        },
        DEAL: {
            DEAL_DETAIL: "mobile/enterprise/deal/deal_detail",
            DEAL_RECORD: "mobile/enterprise/deal/deal_record"
        },
        MY_SHOP: {
            MY_SHOP: "mobile/enterprise/my_shop/my_shop"
        },
        SCAN_SEARCHING: {
            SCAN: "mobile/enterprise/scan_searching/scan",
            SCAN_RESULT: "mobile/enterprise/scan_searching/scan_result"
        },
        WRITE_OFF: {
            ENTER_CODE: "mobile/enterprise/write_off/enter_code",
            SCAN: "mobile/enterprise/write_off/scan",
            WRITE_OFF: "mobile/enterprise/write_off/write_off",
            WRITE_OFF_DETAIL: "mobile/enterprise/write_off/write_off_detail",
            WRITE_OFF_RECORD: "mobile/enterprise/write_off/write_off_record",
            WRITE_OFF_RESULT: "mobile/enterprise/write_off/write_off_result"
        }
    }
};