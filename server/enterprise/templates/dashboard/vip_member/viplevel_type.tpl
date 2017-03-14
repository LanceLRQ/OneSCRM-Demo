{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "viplevel" %}
{% block db_title %}会员等级 - 等级策略{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="container" ng-controller="Dashboard_viplevel_type_Controller">
        <h4 class="block">会员等级</h4>
        <hr>
        <div>
            <a href="{% url 'ent_board_vip_member_viplevel_settings' params.eid %}" class="btn btn-primary">设置等级</a>
            &nbsp;&nbsp;
            <button class="btn btn-primary">发布</button>
        </div>
        <br>
        <form>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>会员等级</th>
                    <th>成长值指标</th>
                    <th>成长值范围</th>
                    <th>会员折扣</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_viplevel_type_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}