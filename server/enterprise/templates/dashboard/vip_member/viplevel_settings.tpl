{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "viplevel" %}
{% block db_title %}会员等级 - 等级策略{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_viplevel_settings_Controller">
        <h4 class="block">等级策略/等级设置</h4>
        <a href="{% url 'ent_board_vip_member_viplevel' params.eid %}" style="float: right;margin-top: -25px">返回</a>
        <hr>
        <div>
            <div>
                提示：等级成长值指标保存后再次修改会影响所有会员的等级变更，建议确认成长值指标后不随意修改。
            </div>
            <hr>
            <form >
                <table class="table table-noborder">
                    <tr>
                        <td>等级成长值指标</td>
                        <td><input type="radio">累计积分</td>
                        <td colspan="2" style="font-size: small;color: #9d9d9d">默认等级成长随会员的累计积分值增长</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="radio">累计消费</td>
                        <td colspan="2" style="font-size: small;color: #9d9d9d">默认等级成长随会员的累计消费金额增常（按实际买单金额+实际卡券购买金额计算）</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="radio">累计充值</td>
                        <td colspan="2" style="font-size: small;color: #9d9d9d">默认等级成长随会员的累计充值金额增长（按实际充值金额计算）</td>
                    </tr>
                    <tr>
                        <td>计算策略</td>
                        <td><input type="radio">每个自然年度累计积分计算</td>
                        <td><input type="radio">每个自然年度累计消费金额计算</td>
                        <td><input type="radio">每个自然年度累计充值金额计算</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="radio">所有年度累计积分计算</td>
                        <td><input type="radio">所有年度累计消费金额计算</td>
                        <td><input type="radio">所有年度累计充值金额计算</td>
                    </tr>
                    <tr>
                        <td>不满足条件时</td>
                        <td><input type="radio">逐年逐层降级</td>
                        <td colspan="2" style="font-size: small;color: #9d9d9d">每个自然年最后一天零点降级</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3"><input type="radio">直接降为原始等级</td>
                    </tr>
                </table>
                <hr>
                <table class="table">
                    <thead>
                    <tr>
                        <th><input type="checkbox">&nbsp;&nbsp;等级编号</th>
                        <th>等级名称</th>
                        <th>成长值范围(大于0的整数且等级范围连续)</th>
                        <th>折扣率(1到100的整数)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox">&nbsp;&nbsp;1</td>
                        <td><input type="text"></td>
                        <td>0 - <input type="text"></td>
                        <td><input type="text">%</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <button class="btn btn-primary">添加等级</button>
                            <button class="btn btn-danger">删除等级</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <hr>
                <div align="center">
                    <button class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_viplevel_settings_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}