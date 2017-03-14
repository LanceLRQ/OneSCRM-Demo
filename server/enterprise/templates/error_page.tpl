<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>提示信息 - OneSCRM</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/library/bootstrap/css/bootstrap.min.css">
    {% block base_head %}{% endblock %}
</head>
<body>
<div class="container" style="margin-top: 50px;">
    <div class="panel panel-{{ eparam.color }}" style="width: 80%; max-width: 450px; margin: 0 auto;">
        <div class="panel-heading">
            <span class="panel-title" style="text-align: center"><h4>提示信息</h4></span>
        </div>
        <div class="panel-body" style="max-height: 240px;" align="center">
            <h4>{{ errmsg }}</h4>
        </div>
        <div class="panel-footer">
            {% if action != 'none' %}
            <a href="{% if action == 'back' %}javascript:history.go(-1);{% else %}{{ eparam.redirect_url }}{% endif %}" class="btn btn-{{ eparam.color }} btn-block">
                {{ eparam.duration / 1000 }} 秒钟后若页面没有自动跳转请点击这里
            </a>
            {% endif %}
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    setTimeout(function () {
        {% if action != 'none' %}
        {% if action == 'back' %}
        history.go(-1);
        {% else %}
        location.href = "{{ eparam.redirect_url }}";
        {% endif %}
        {% endif %}
    },{{ eparam.duration }});
</script>
</html>
