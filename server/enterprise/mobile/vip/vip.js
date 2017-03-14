module.exports = {
    vipcard: {
        get: require('./vipcard/get'),
        card: require('./vipcard/card')
    },
    vip: {
        write_info: require('./vip/write_info').info,
        write_info_save: require('./vip/write_info').save,
        pay: require('./vip/pay'),
        notice: require('./vip/notice'),
        invite: require('./vip/invite'),
        invite_record: require('./vip/invite_record'),
        recharge: require('./vip/recharge'),
        balance: require('./vip/balance'),
        recharge_guide: require('./vip/recharge_guide'),
        rights: require('./vip/rights')
    },
    credit: {
        guide: require('./credit/guide'),
        credit: require('./credit/credit'),
        exchange: require('./credit/exchange'),
        exchange_items: require('./credit/exchange_items')
    },
    cards_and_coupons: {
        cards_and_coupons: require('./cards_and_coupons/cards_and_coupons'),
        write_off: require('./cards_and_coupons/write_off'),
        soon_to_expire: require('./cards_and_coupons/soon_to_expire'),
        use: require('./cards_and_coupons/use'),
        details: require('./cards_and_coupons/details'),
        applicable_store: require('./cards_and_coupons/applicable_store')
    },
    prize: {
        prize: require('./prize/prize'),
        write_off: require('./prize/write_off')
    },
    level: {
        guide: require('./level/guide'),
        level: require('./level/level')
    },
    welfare: {
        welfare: require('./welfare/welfare'),
        coupons: require('./welfare/coupons'),
        coupon_get: require('./welfare/coupon_get'),
        cards: require('./welfare/cards'),
        card_get: require('./welfare/card_get'),
        activity: require('./welfare/activity'),
        lucky_draw: require('./welfare/lucky_draw')
    }
};