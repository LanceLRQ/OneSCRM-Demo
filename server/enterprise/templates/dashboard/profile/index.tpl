{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.index" %}
{% set board_nav_lv1 = "index" %}
{% set board_hide_nav_lv2 = true %}
{% block db_title %}概览{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_profile_index_Controller">
        <div>Hooinfo，下午好！</div><br />
        <div class="alert alert-warning"><span class="glyphicon glyphicon-alert"></span>&nbsp;我是可爱的公告</div>
        <hr />
        <table width="100%">
            <tr>
                <td align="center">
                    <h1>10</h1>
                    昨日新增粉丝<br />&nbsp;
                </td>
                <td align="center">
                    <h1>10</h1>
                    昨日新增会员<br />&nbsp;
                </td>
                <td align="center">
                    <h1>1000</h1>
                    昨日充值额<br />&nbsp;
                </td>
                <td align="center">
                    <h1>1000</h1>
                    昨日买单额<br />（不含余额支付）
                </td>
                <td align="center">
                    <h1>1000</h1>
                    昨日销售额<br />（不含余额支付）
                </td>
                <td align="center">
                    <h1>2333</h1>
                    总粉丝数<br />&nbsp;
                </td>
                <td align="center">
                    <h1>233</h1>
                    总会员数<br />&nbsp;
                </td>
            </tr>
        </table>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title"><span class="glyphicon glyphicon-comment"></span> 待办事项</div>
                    </div>
                    <table class="table table-nocolor panel-body">
                        <tr>
                            <td width="50">1.</td>
                            <td>去完善<a href="">商家资料</a></td>
                        </tr>
                        <tr>
                            <td>2.</td>
                            <td>去创建门店</td>
                        </tr>
                        <tr>
                            <td>3.</td>
                            <td>去创建会员卡</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="panel-title">最新公告</div>
                    </div>
                    <div class="list-group">
                        <a href="" class="list-group-item">【系统公告】新功能上线啦<span class="badge">7-20 13:14</span></a>
                        <a href="" class="list-group-item">【应用公告】应用功能也上线啦<span class="badge">7-10 23:33</span></a>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <h2>常用功能</h2>
        <button class="btn btn-success btn-lg">微信</button>&nbsp;
        <button class="btn btn-info btn-lg">发布商品</button>&nbsp;
        <button class="btn btn-danger btn-lg">页面管理</button>&nbsp;
        <button class="btn btn-warning btn-lg">客服系统</button>&nbsp;
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_index = angular.module('dashboard.index',['app.LoadingLayout']);
        db_index.controller("Dashboard_profile_index_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}