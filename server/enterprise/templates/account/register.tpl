<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>注册 - OneSCRM商户管理后台</title>
    <link rel="stylesheet" href="/static/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    {% block base_head %}{% endblock %}
</head>
<body>
<div class="jumbotron" style="height: 100%;">
    <div style="width: 520px; margin: 0 auto;" >
        <form id="register_form">
            <table class="table table-noborder">
                <tr>
                    <td>
                        <div class="input-group input-group-lg" style="width:100%;">
                            <input name="username" type="text" placeholder="请输入你的手机号" class="form-control">
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div class="input-group input-group-lg" style="width:100%;">
                            <input name="password" type="password" placeholder="请输入6位以上密码" class="form-control" >
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div class="input-group input-group-lg" style="width:100%;">
                            <input name="repassword" type="password" placeholder="再次输入确认" class="form-control">
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <div class="input-group input-group-lg" style="width:100%;">
                            <input type="text" placeholder="使用微信扫描右侧二维码获取验证码" class="form-control">
                        </div>
                    </td>
                    <td rowspan="3" width="140" valign="top"><img width="110" height="110"></td>
                </tr>
                <tr>
                    <td><button type="button" class="btn btn-default btn-lg">扫码使用演示</button></td>
                </tr>
                <tr>
                    <td><button class="btn btn-primary btn-lg btn-block">创建账号</button></td>
                </tr>
            </table>
        </form>
        <div class="alert alert-danger" id="msg" style="display: none"></div>
        <div align="center"><h4>已经有账号？<br /><br /><a href="{% url 'ent_account_login' %}">登录</a></h4></div>
    </div>
</div>
<script type="text/javascript" src="/static/library/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#register_form").submit(function () {
            $.post("{% url 'ent_account_register_save' %}", $(this).serialize(), function (data, textStatus) {
                if(textStatus == 'success'){
                    if(data.errcode == 0){
                        window.location.href = '{% url 'wx_component_mp_authorization_start' %}';
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
</body>
</html>
