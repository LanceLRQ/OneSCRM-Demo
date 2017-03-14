{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipcard" %}
{% block db_title %}会员卡 - 创建会员卡{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_vipcard_index_Controller">
        <h4 class="block">会员卡</h4>
        <hr>
        <div style="width:100%;background-color: #ece9e9; padding: 10px 20px; line-height:30px;">
            检测到微信公众号已开通微信会员卡,请确定创建微信会员卡的方式<br />
            注:选定后不可更改。新创建微信会员卡时无法导入已有会员数据
        </div>
        <br>
        <div>
            <a href="#" class="btn btn-primary">同步微信会员卡</a>
            &nbsp;
            <a href="{% url 'ent_board_vip_member_vipcard_edit' params.eid%}" class="btn btn-primary">创建会员卡</a>
        </div>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_vipcard_index_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}
