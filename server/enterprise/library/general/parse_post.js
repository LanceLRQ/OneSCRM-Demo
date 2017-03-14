module.exports = function *(next) {
    this.parse_post = function (options) {
        if(options == undefined) return false;
        var post_body = {};
        try{
            for(key in options) {
                var type = options[key];
                if (this.request.body[key] == undefined) {
                    return false;
                }
                switch (type) {
                    case "string":
                        post_body[key] = this.request.body[key];
                        break;
                    case "int":
                    case "integer":
                        post_body[key] = parseInt(this.request.body[key]);
                        break;
                    case "float":
                        post_body[key] = parseFloat(this.request.body[key]);
                        break;
                    case "bool":
                    case "boolean":
                        post_body[key] = Boolean(this.request.body[key]);
                        break;
                    default:
                        post_body[key] = this.request.body[key];
                }
            }
            return post_body;
        }catch(ex){
            return false;
        }
    };
    yield next;
};