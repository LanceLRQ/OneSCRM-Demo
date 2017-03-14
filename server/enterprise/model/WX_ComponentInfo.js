module.exports = function (mongoose) {
    return mongoose.model('WX_ComponentInfo', mongoose.Schema({
        userID: Number,
        enterpriseId: Number,
        appID: String,
        authed: Boolean,
        authorization_info:{
            accessToken: String,
            accessTokenExpiresIn: Number,
            refreshToken: String,
            func_info: String               // Dump JSON Data
        },
        authorizer_info:{
            nick_name: String,
            head_img: String,
            service_type_info: Number,
            verify_type_info: Number,
            user_name: String,
            business_info: String,
            alias: String,
            qrcode_url: String
        }
    }))
};