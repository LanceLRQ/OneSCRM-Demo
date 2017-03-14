module.exports = function (mongoose) {
    return mongoose.model('WX_ComponentStore', mongoose.Schema({
        sid: String,
        PoiId: String,
        checkResult: String,
        msg: String,
        wxStoreStatus: Number,
        base_info: mongoose.Schema.Types.Mixed
    }))
};