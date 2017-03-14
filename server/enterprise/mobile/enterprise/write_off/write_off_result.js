/**
 * Created by solar on 16/9/3.
 */
module.exports = function *(next) {
    yield this.render(this.const.TEMPLATES.ENTERPRISE.WRITE_OFF.WRITE_OFF_RESULT);
};