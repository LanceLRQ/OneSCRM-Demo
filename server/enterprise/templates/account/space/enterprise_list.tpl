{% extends "../space.tpl" %}
{% set ng_app = "account.space" %}
{% set board_nav_lv1 = "enterprise_list" %}
{% block db_title %}公众号管理 - 个人空间{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Account_space_enterpriselist_Controller">
        <table class="table table-noborder">
            <tbody>
                <tr>
                    <td width="100"><a href="{% url 'wx_component_mp_authorization_start' %}" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>&nbsp;添加公众号</a></td>
                    <td width="200">公众号数：1个<br />可用配额：1个</td>
                    <td align="right">
                        <div class="btn-group btn-group-sm">
                            <button class="btn btn-primary">最新</button>
                            <button class="btn btn-default">最早</button>
                        </div>
                    </td>
                    <td align="right" width="200">
                        <input type="text" class="form-control" placeholder="搜索公众号名称">
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th></th>
                    <th>公众号名称</th>
                    <th>粉丝数</th>
                    <th>消息数</th>
                    <th>配额状态</th>
                    <th>授权状态</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="item in enterpriseList">
                    <td width="80"><img ng-src="{% raw %}{{ item.logoUrl }}{% endraw %}" width="80" height="80"></td>
                    <td >
                        <strong ng-bind="item.enterpriseName"></strong><br />认证服务号
                    </td>
                    <td>昨日：0<br>总数：22</td>
                    <td>昨日：0<br>总数：0</td>
                    <td><span class="text-success">正常使用</span><br />永久</td>
                    <td>已经授权<br />1天</td>
                    <td width="100">
                        <a href="/enterprise/{% raw %}{{ item.id }}{% endraw %}/dashboard/profile" class="btn btn-default">进入后台</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
{% endblock %}
{% block db_script %}
<script type="text/javascript">
    var account_space = angular.module('account.space', ['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog', 'app.LoadingLayout']);
    account_space.controller("Account_space_enterpriselist_Controller", ["$scope", "$http", 'myAlert', 'LoadingLayout', function ($scope, $http, myAlert, LoadingLayout) {
        LoadingLayout.show();
        $http({
            cache: false,
            method: "POST",
            url: '{% url 'ent_account_space_enterprise_list' %}'
        }).then(function (response) {
            var result = response.data;
            if(result.errcode == 0){
                LoadingLayout.hide();
                $scope.enterpriseList = result.data;
            }else{
                LoadingLayout.error();
                myAlert({
                    btn_ok_color: "danger",
                    title: '加载错误',
                    content: result.errmsg
                }).show();
            }
        });
    }]);
</script>

{% endblock %}