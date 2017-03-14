/**
 * Created by solar on 16/9/3.
 */
module.exports = function *(next) {
    yield this.render(this.const.TEMPLATES.ENTERPRISE.ACCOUNT_BINDING.SHOP_HELPER);
};