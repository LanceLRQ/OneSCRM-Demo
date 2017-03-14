{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.settings" %}
{% set board_nav_lv1 = "settings" %}
{% set board_nav_lv2 = "store" %}
{% block db_title %}门店设置 - 门店管理{% endblock %}
{% block db_nav_lv2 %}
{% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_settings_store_list_Controller">
        <h4 class="block">门店设置</h4>
        <hr>
        <a href="{% url 'ent_board_settings_store_new' params.eid %}" class="btn btn-primary">新建门店</a>
        &nbsp;
        <button class="btn btn-success">同步微信门店</button>
        <br />
        <br />
        <form class="form-inline">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>门店名称</th>
                    <th>门店电话</th>
                    <th>门店地址</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="opt in storeList">
                        <td><input type="checkbox"></td>
                        <td><span ng-bind="opt.storeName"></span></td>
                        <td><span ng-bind="opt.contactPhone"></span></td>
                        <td><span ng-bind="opt.address"></span></td>
                        <td><span ng-bind="storeStaus[opt.openStatus]"></span></td>
                        <td>
                            <a href="{% url 'ent_board_settings_store_edit' params.eid %}?store_id={% raw %}{{ opt.id }}{% endraw %}">编辑</a>&nbsp;
                            <a ng-click="statusChange(opt.status)" ng-bind="storeStaus[opt.openStatus]"></a>&nbsp;
                            <a href="#">删除</a>
                        </td>
                    </tr>
                    <tr ng-hide="storeList.length">
                        <td colspan="6" align="center">没有门店信息，请先创建门店</td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_storeList = angular.module("dashboard.settings",['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog','app.LoadingLayout']);
        db_storeList.controller('Dashboard_settings_store_list_Controller',['$scope','$http','myAlert','LoadingLayout',function ($scope,$http,myAlert,LoadingLayout) {
        $http({
            cache:false,
            method:"POST",
            url: '{% url 'ent_board_settings_store_list' params.eid %}'
        }).then(function (response) {
            var result = response.data;
            if(result.errcode==0){
                LoadingLayout.hide();
                $scope.storeList = result.data;
                $scope.storeStaus = {
                    1:"启用",
                    2:"停用"
                }
            }
            else{
                myAlert({
                    btn_ok_color: "danger",
                    title: '加载错误',
                    content: result.msg
                }).show();
            }
        });
        $scope.statusChange = function(value){
            if(value == 1){
                this.staus=2;
            }
            else{
                this.staus=1;
            }
        }
    }]);
    </script>
{% endblock %}