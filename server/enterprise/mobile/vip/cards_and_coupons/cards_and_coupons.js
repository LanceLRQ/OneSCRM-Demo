/**
 * Created by solar on 16/9/3.
 */
module.exports = function *(next) {
    yield this.render(this.const.TEMPLATES.VIP.CARDS_AND_COUPONS.CARDS_AND_COUPONS);
};