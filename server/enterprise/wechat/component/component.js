
module.exports= {
    api: {
        receive_ticket: require('./api/receive_ticket')
    },
    mp: {
        callback: require('./mp/callback'),
        start_authorization: require('./mp/start_auth'),
        authorization_callback: require('./mp/auth_callback'),
        write_menu: require('./mp/write_menu')
    }
};