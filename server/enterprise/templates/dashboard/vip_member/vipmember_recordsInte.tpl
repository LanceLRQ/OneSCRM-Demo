{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipmanage" %}
{% block db_title %}会员中心 - 会员详情{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_vipmember_recordsInte_Controller">
        <h4 class="block">会员中心/会员记录 - kingswwong</h4>
        <a href="{% url 'ent_board_vip_member_vipmanage' params.eid %}" style="float: right;margin-top: -25px">返回</a>
        <hr>
        <ul class="nav nav-tabs" role="tablist" style="margin: 0 auto;">
            <li role="presentation"><a href="{% url 'ent_board_vip_member_vipmember_recordsPay' params.eid %}" id="tab-btn-home" data-toggle="tab" role="tab">买单记录</a></li>
            <li role="presentation"><a href="{% url 'ent_board_vip_member_vipmember_recordsRech' params.eid %}" id="tab-btn-submit" data-toggle="tab" role="tab">充值记录</a></li>
            <li role="presentation"><a href="{% url 'ent_board_vip_member_vipmember_recordsBuy' params.eid%}" id="tab-btn-history" data-toggle="tab" role="tab">卡卷购买记录</a></li>
            <li role="presentation" class="active"><a href="#" id="tab-btn-history" data-toggle="tab" role="tab">积分记录</a></li>
            <li role="presentation"><a href="{% url 'ent_board_vip_member_vipmember_recordsCancel' params.eid %}" id="tab-btn-history" data-toggle="tab" role="tab">核销记录</a></li>
            <li role="presentation"><a href="{% url 'ent_board_vip_member_vipmember_recordsGift' params.eid%}" id="tab-btn-history" data-toggle="tab" role="tab">兑奖记录</a></li>
        </ul>
        <br>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>积分变更</th>
                <th>变更量</th>
                <th>剩余积分</th>
                <th>变更方式</th>
                <th>变更时间</th>
                <th>变更门店</th>
                <th>收银员</th>
                <th>备注</th>
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
            </tr>
            </tbody>
        </table>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_vipmember_recordsInte_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}