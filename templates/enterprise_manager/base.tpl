<!DOCTYPE html>
<html lang="zh-CN"{% if ng_app != '' %} ng-app="{{ ng_app }}"{% endif %}>
<head>
    <meta charset="UTF-8">
    <title>{% block base_title %}{% endblock %} - 诗远SCRM商户管理后台</title>
    <link rel="stylesheet" href="/static/library/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/enterprise_manager/base.css">
    <script type="text/ng-template" id="/emgr/dialog/window.tpl">{% include "dialog/window.tpl" %}</script>
    <script type="text/ng-template" id="/emgr/dialog/empty.tpl"></script>
    <script type="text/ng-template" id="/emgr/dialog/alert.tpl">{% include "dialog/alert.tpl" %}</script>
    <script type="text/ng-template" id="/emgr/dialog/confirm.tpl">{% include "dialog/confirm.tpl" %}</script>
    {% block base_head %}{% endblock %}
</head>
<body>
    {% include "navbar.tpl" %}
    <div class="container" style="width: 90%">
        <div class="row">
            <div class="col-sm-2">
                <!--左侧栏-->
                {% include 'left-nav.tpl' %}
            </div>
            <div class="col-sm-10">
                {% block base_body %}{% endblock %}
            </div>
        </div>
    </div>
    {% if ng_app != '' %}<script type="text/javascript" src="/static/library/angularjs/angular.js"></script>
    <script type="text/javascript" src="/static/library/angularjs/ui-bootstrap-2.0.0.min.js"></script>
    <script type="text/javascript" src="/static/library/angularjs/angular-ui-router.min.js"></script>
    <script type="text/javascript" src="/static/dashboard/services/dialog.js"></script>{% endif %}
    {% block base_script %}{% endblock %}

</body>
</html>
