{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "viplabel" %}
{% block db_title %}会员管理 - 标签管理{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_viplabel_manage_Controller">
        <h4 class="block">标签管理</h4>
        <hr>
        <br>
        <div>
            <a href="{% url 'ent_board_vip_member_viplabel_new' params.eid %}" class="btn btn-primary">新建标签</a>
        </div>
        <br>
        <div>
            排序
            &nbsp;&nbsp;
            <div class="btn-group btn-group-sm">
                <button class="btn btn-primary">最新</button>
                <button class="btn btn-default">最早</button>
            </div>
            <div style="float: right">
                <button class="btn btn-sm btn-primary">搜索</button>
            </div>
            <div style="float: right" class="input-group-sm">
                <input type="text" class="form-control" placeholder="搜索标签名">
            </div>
        </div>
        <hr>
        <br>
        <table class="table table-noborder">
            <tr>
                <td>
                    <div style="background-color: #f0f0f0;width: 250px; height: 150px;padding: 10px 10px">
                        <h5>#买过试用装</h5>
                        <div>
                            <a href="#" class="label label-nocolor">4个粉丝</a>
                            <a href="#" class="label label-nocolor">2天前创建</a>
                        </div>
                        <br>
                        <div>
                            <a href="{% url 'ent_board_vip_member_viplabel_divide' params.eid %}" class="btn btn-sm btn-primary">查看会员</a>
                            <button class="btn btn-sm btn-primary">编辑标签</button>
                            <button class="btn btn-sm btn-primary">删除标签</button>
                        </div>
                    </div>
                </td>
                <td>
                    <div style="background-color: #f0f0f0;width: 250px; height: 150px;padding: 10px 10px">
                        <h5>#体验过产品</h5>
                        <div>
                            <a href="#" class="label label-nocolor">0个粉丝</a>
                            <a href="#" class="label label-nocolor">2天前创建</a>
                        </div>
                        <br>
                        <div>
                            <button class="btn btn-sm btn-primary">查看粉丝</button>
                            <button class="btn btn-sm btn-primary">编辑标签</button>
                            <button class="btn btn-sm btn-primary">删除标签</button>
                        </div>
                    </div>
                </td>
                <td>
                    <div style="background-color: #f0f0f0;width: 250px; height: 150px;padding: 10px 10px">
                        <h5>#重要客户</h5>
                        <div>
                            <a href="#" class="label label-nocolor">4个粉丝</a>
                            <a href="#" class="label label-nocolor">2天前</a>
                        </div>
                        <br>
                        <div>
                            <button class="btn btn-sm btn-primary">查看粉丝</button>
                            <button class="btn btn-sm btn-primary">编辑标签</button>
                            <button class="btn btn-sm btn-primary">删除标签</button>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_viplabel_manage_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}