module.exports = function (mongoose) {
    return mongoose.model('WX_ComponentSetting', mongoose.Schema({
        appID: String,
        verifyTicket: String,
        accessToken: String,
        accessTokenExpiresIn: Number,
        preAuthCode: String,
        preAuthCodeExpiresIn:Number
    }))
};