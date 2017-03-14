{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "viplabel" %}
{% block db_title %}标签管理 - 优质会员{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_viplabel_divide_Controller">
        <h4 class="block">标签管理/优质会员</h4>
        <hr>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>昵称</th>
                <th>会员名</th>
                <th>会员号</th>
                <th>手机</th>
                <th>账户积分</th>
                <th>账户余额</th>
                <th>等级</th>
                <th>领卡时间</th>
                <th>最后消费时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <a href="" class="label label-nocolor">标签</a>
                    <a href="" class="label label-primary">收银</a>
                    <a href="" class="label label-success">详情</a>
                    <a href="" class="label label-warning">记录</a>
                    <a href="" class="label label-danger">冻结</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_viplabel_divide_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}