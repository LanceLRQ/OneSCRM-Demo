module.exports = {
    account_binding: {
        identity_verification: require('./account_binding/identity_verification'),
        shop_helper: require('./account_binding/shop_helper')
    },
    deal: {
        deal_detail: require('./deal/deal_detail'),
        deal_record: require('./deal/deal_record')
    },
    my_shop: {
        my_shop: require('./my_shop/my_shop')
    },
    scan_searching: {
        scan: require('./scan_searching/scan'),
        scan_result: require('./scan_searching/scan_result')
    },
    write_off: {
        enter_code: require('./write_off/enter_code'),
        scan: require('./write_off/scan'),
        write_off: require('./write_off/write_off'),
        write_off_detail: require('./write_off/write_off_detail'),
        write_off_record: require('./write_off/write_off_record'),
        write_off_result: require('./write_off/write_off_result')
    }
};
