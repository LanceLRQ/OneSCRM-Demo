module.exports = function(router, context) {
    return {
        parse: function (str, line, parser, types, stack, options, swig) {
            return true;
        },
        compile: function (compiler, args, content, parents, options, blockName) {
            try {
                var myargs = [];
                var _ctx = context;
                args.forEach(function (val) {
                    myargs.push(eval(val));
                });
                var url = "";

                if (myargs.length > 1) {
                    url = router.url(myargs[0], myargs.slice(1, myargs.length));
                } else {
                    url = router.url(myargs[0]);
                }
                if (typeof url == 'object') {
                    url = '#!error';
                }
                return '_output += "' + url + '";\n';
            }catch (ex){
                console.log(ex);
                return '_output += "ERROR";\n';
            }
        },
        ends: false,
        blockLevel: false
    }
};