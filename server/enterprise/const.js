module.exports = {
    // 是否开启调试模式
    DEBUG: true,
    API_DEBUG: false,
    // 网站域名
    DOMAIN: 'www.onescrm.com',
    // MongoDB连接参数
    //MONGODB_SERVER: "mongodb://scrm:bnuep5090@172.21.136.205/scrm",
    MONGODB_SERVER: "mongodb://xxx:xxx@139.129.95.53:23333/scrm",
    // 微信第三方平台 TOKEN
    COMPONENT_TOKEN: '',
    // 微信第三方平台 AES_KEY
    COMPONENT_ENCODING_AES_KEY: '',
    // 微信第三方平台 APP_ID
    COMPONENT_APP_ID: '',
    // 微信第三方平台 APP_SECERT
    COMPONENT_APP_SECERT: '',
    // 微信第三方平台 授权回调页面
    COMPONENT_AUTH_CALLBACK: "/wechat/component/mp/authorization/callback",
    // 微信接口地址列表
    WECHAT_API: require('./library/const/wechat_apis'),
    // 中国省市县数据常量
    CONST_CITYS: require('./library/const/citys'),
    // 业务服务器地址
    //SDAP_ADDRESS: "http://192.168.199.222:8080",
    SDAP_ADDRESS: "http://123.207.63.133:8080",
    // 业务服务器接口地址列表
    SDAP_API: require('./library/const/sdap_apis'),
    // 模板数据列表
    TEMPLATES: require('./library/const/template_files'),
    // 错误信息列表
    ERROR_MESSAGE: require('./library/const/error_message'),
    // SDAP移动端TOKEN
    SDAP_MOBILE_TOKEN: ''
};