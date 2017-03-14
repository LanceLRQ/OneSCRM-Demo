{% extends "../base.tpl" %}
{% set left_nav = 'vip_member' %}
{% set ng_app = 'app.emgr_vip_member' %}
{% block base_head %}
    <script type="text/ng-template" id="/emgr/vip_member/vip_card.tpl">
        {% include "vip_card.tpl" %}
    </script>
{% endblock %}
{% block base_title %}会员管理{% endblock %}
{% block base_body %}
    <div ng-controller="Emgr_vip_member_Controller">
        <uib-tabset active="activePill">
            <uib-tab index="0" heading="卡片设计" select="tabSelectListener('{% url 'emgr_settings_info' %}')"></uib-tab>
        </uib-tabset>
        <div ui-view="emgr_vip_member"></div>
    </div>
{% endblock %}
{% block base_script %}
    <script type="text/javascript" src="/static/apps/enterprise_manager/vip_member.js"></script>
{% endblock %}