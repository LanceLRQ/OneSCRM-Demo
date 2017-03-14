module.exports = function(port){
    return {

        // 注册服务器框架
        server: require('koa')(),
        // 注册服务器中间件
        middleware: {
            static: require('koa-static'),
            path: require('path'),
            router: require('koa-router'),
            postbody: require('koa-body'),
            render: require('koa-swig'),
            mongoose: require('mongoose')
        },
        // 路由模块
        router: null,
        // 注册系统公有库
        library: require('./library'),
        // 注册环境常量
        env_const: require('./const'),
        // 系统环境目录
        rootDir: __dirname,
        // 系统公用目录
        publicDir: null,
        // 系统模板目录
        templateDir: null,

        // 启动服务
        start: function () {
            var sender = this;
            // 连接MongoDB
            this.middleware.mongoose.connect(this.env_const.MONGODB_SERVER);
            this.middleware.mongoose.Promise = global.Promise;
            this.server.context.model = require('./model')(this.middleware.mongoose);
            // 注册公用目录到路由
            this.publicDir =  this.middleware.path.join(this.rootDir, './public');
            this.templateDir = this.middleware.path.join(this.rootDir, './templates');
            this.server.use(this.middleware.static(this.publicDir));
            // 注册系统路由
            this.router = this.middleware.router();
            // 注册商家端路由
            this.router.get('/', function*(next){
                this.body = "网站正在建设中...";
                //this.redirect(this.router.url('ent_account_login'));
            });
            //注册商家管理面板路由
            this.router.use('/enterprise/', require('./enterprise/router')(this).routes());
            //注册手机商家端路由
            this.router.use('/mobile/enterprise/', require('./mobile/enterprise/router')(this).routes());
            //注册手机会员端路由
            this.router.use('/mobile/vip/', require('./mobile/vip/router')(this).routes());
            // 注册微信接口系统路由
            this.router.use('/wechat/', require('./wechat/component/router')(this).routes());
            // 注册微信接口系统（移动端）路由
            this.router.use('/wechat/mobile/', require('./wechat/mobile/router')(this).routes());
            // 应用路由
            this.server.use(this.router.routes()).use(this.router.allowedMethods());
            this.server.context.router = this.router;
            // 将系统环境常量注册到上下文
            this.server.context.const = this.env_const;
            this.server.context.enterprise = {};
            this.server.context.wechat = {};
            this.server.context.wechat.enabled = false;
            this.server.context.mobile = {};
            this.server.context.getSysTime = function () {
                return Math.floor((new Date().getTime())/1000);
            };
            // 执行监听
            this.server.listen(port);
        }

    }
};

