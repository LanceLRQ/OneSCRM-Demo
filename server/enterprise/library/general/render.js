var extend = require('node.extend');
module.exports = function (server) {
    return function *(next) {
        this.$render = server.middleware.render({
            root: server.templateDir,
            autoescape: true,
            cache: false,
            ext: "tpl",
            tags: {
                "url": server.library.swig.tag_url(server.router, this)
            }
        });
        this.render = function (view, options) {
            if (options == undefined) options = {};
            var opts = extend(options, {
                params: (this.params == undefined) ? null : this.params
            });
            return this.$render(view, opts);
        };
        yield next;
    };
};