module.exports = {
    general: {
        session_manager: require('./library/general/session_manager'),
        simple_data_access_protocol: require('./library/general/sdap'),
        parse_post: require('./library/general/parse_post'),
        render: require('./library/general/render'),
        restful: require('./library/general/restful'),
        error_page: require('./library/general/errpage')
    },
    swig: {
        tag_url: require('./library/swig/tag_url')
    },
    enterprise: {
        info_provider: require('./library/enterprise/info_provider')
    },
    mobile:{
        sdap_mobile: require('./library/mobile/sdap_mobile'),
        session_manager: require('./library/mobile/session_manager')
    },
    wechat: {
        signatureProvider: require('./library/wechat/signature'),
        msgBaseProvider: require('./library/wechat/msg_base'),
        msg_response: require('./library/wechat/msg_response'),
        wechat_enable: require('./library/wechat/wechat_enable'),
        networkProvider: require('./library/wechat/network'),
        csettingProvider: require('./library/wechat/component_setting'),
        mpInfoProvider: require('./library/wechat/component_info')
    }
};