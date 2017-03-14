{% extends "../base.tpl" %}
{% set left_nav = 'settings' %}
{% set ng_app = 'app.emgr_settings' %}
{% block base_head %}
    <script type="text/ng-template" id="/emgr/settings/info.tpl">
    {% include "info.tpl" %}
    </script>
{% endblock %}
{% block base_title %}商户设置{% endblock %}
{% block base_body %}
    <div ng-controller="Emgr_settings_Controller">
        <uib-tabset active="activePill">
            <uib-tab index="0" heading="商家信息" select="tabSelectListener('{% url 'emgr_settings_info' %}')"></uib-tab>
        </uib-tabset>
        <div ui-view="emgr_settings"></div>
    </div>
{% endblock %}
{% block base_script %}
    <script type="text/javascript" src="/static/apps/enterprise_manager/settings.js"></script>
{% endblock %}