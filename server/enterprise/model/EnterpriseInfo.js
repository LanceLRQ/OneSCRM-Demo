module.exports = function (mongoose) {
    return mongoose.model('EnterpriseInfo', mongoose.Schema({
        accountId: Number,
        enterpriseId: Number,
        enterpriseInfo: mongoose.Schema.Types.Mixed
    }))
};