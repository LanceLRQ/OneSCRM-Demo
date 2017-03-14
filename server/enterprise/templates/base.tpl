<!DOCTYPE html>
<html lang="zh-CN"{% if ng_app != '' %} ng-app="{{ ng_app }}"{% endif %}>
<head>
    <meta charset="UTF-8">
    <title>{% block base_title %}{% endblock %} - OneSCRM 商户管理后台</title>
    <link rel="stylesheet" href="/static/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    <script type="text/ng-template" id="/templates/dialog/window.tpl">{% include "dialog/window.tpl" %}</script>
    <script type="text/ng-template" id="/templates/dialog/alert.tpl">{% include "dialog/alert.tpl" %}</script>
    <script type="text/ng-template" id="/templates/dialog/confirm.tpl">{% include "dialog/confirm.tpl" %}</script>
    <script type="text/ng-template" id="empty.tpl"></script>
    {% block base_head %}{% endblock %}
</head>
<body>
    {% include "top_navbar.tpl" %}
    {% block base_body %}{% endblock %}
    {% if ng_app != '' %}
    <script type="text/javascript" src="/static/library/angularjs/angular.js"></script>
    <script type="text/javascript" src="/static/library/angularjs/ui-bootstrap-2.0.0.min.js"></script>
    <script type="text/javascript" src="/static/library/angularjs/angular-ui-router.min.js"></script>
    <script type="text/javascript" src="/static/dashboard/services/dialog.js"></script>
    <script type="text/javascript" src="/static/dashboard/services/loading.js"></script>
    {% endif %}
    {% block base_script %}{% endblock %}
</body>
</html>
