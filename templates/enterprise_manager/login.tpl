<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>登录 - 诗远SCRM商户管理后台</title>
    <link rel="stylesheet" href="/static/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/enterprise_manager/base.css">
    {% block base_head %}{% endblock %}
</head>
<body>
    <div class="jumbotron" style="height: 100%;">
        <div style="width: 350px; margin: 0 auto; text-align: center" >
            <h1>商家登录</h1><br /><br />
            <form action="{% url "index_login_check" %}" class="from-group" method="post">
                <div class="input-group input-group-lg">
                    <div class="input-group-addon">账号</div>
                    <input type="text" name="username" class="form-control" value="admin">
                </div><br />
                <div class="input-group input-group-lg">
                    <div class="input-group-addon">密码</div>
                    <input type="password" name="password" class="form-control" value="admin">
                </div><br />
                <label for=""><input type="checkbox" name="rememberMe" value="1"> 自动登录（7天）</label>
                <button class="btn btn-primary btn-lg btn-block">登录</button>
            </form>
        </div>
    </div>
</body>
</html>