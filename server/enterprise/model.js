module.exports = function (mongoose) {
    return {
        EnterpriseInfo: require('./model/EnterpriseInfo')(mongoose),
        WX_ComponentSetting: require('./model/WX_ComponentSetting')(mongoose),
        WX_ComponentInfo: require('./model/WX_ComponentInfo')(mongoose),
        WX_ComponentStore: require('./model/WX_ComponentStore')(mongoose)
    };
};