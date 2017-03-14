<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>登录 - 诗远SCRM商户管理后台</title>
    <link rel="stylesheet" href="/static/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    {% block base_head %}{% endblock %}
</head>
<body>
    <div class="jumbotron" style="height: 100%;">
        <div style="width: 350px; margin: 0 auto; text-align: center" >
            <h1>商家登录</h1><br /><br />
            <form class="from-group" id="login_form">
                <div class="input-group input-group-lg">
                    <div class="input-group-addon">账号</div>
                    <input type="text" name="username" class="form-control" value="">
                </div><br />
                <div class="input-group input-group-lg">
                    <div class="input-group-addon">密码</div>
                    <input type="password" name="password" class="form-control" value="">
                </div><br />
                <label for=""><input type="checkbox" name="rememberMe" value="1"> 自动登录（7天）</label>
                <br /><br />
                <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
            </form><br />
            <div class="alert alert-danger" id="msg" style="display: none"></div>
        </div>
    </div>
</body>
<script type="text/javascript" src="/static/library/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#login_form").submit(function () {
            $.post("{% url 'ent_account_login_check' %}", $(this).serialize(), function (data, textStatus) {
                if(textStatus == 'success'){
                    if(data.errcode==0){
                        window.location = data.data;
                    }else{
                        $("#msg").show().text(data.errmsg);
                    }
                }else{
                    $("#msg").show().text("服务器错误，请稍后重试");
                }
            });
            return false;
        });
    });
</script>
</html>
