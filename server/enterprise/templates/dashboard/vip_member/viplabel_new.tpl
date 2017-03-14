{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "viplabel" %}
{% block db_title %}标签管理 - 新建标签{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_viplabel_new_Controller">
        <h4 class="block">标签管理/新建标签</h4>
        <hr>
        <form >
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3">
                    <table class="table table-noborder">
                        <tr>
                            <td>标签名称</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td colspan="2">自动打标签条件</td>
                        </tr>
                        <tr>
                            <td>条件关系</td>
                            <td><input type="radio" >&nbsp;&nbsp;满足一个条件即可&nbsp;&nbsp;<input type="radio" >&nbsp;&nbsp;必须全部满足</td>
                        </tr>
                        <tr>
                            <td>交易条件</td>
                            <td>
                                <input type="checkbox" >&nbsp;&nbsp;累计积分满&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;分</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="checkbox" >&nbsp;&nbsp;累计充值满&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;元</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="checkbox" >&nbsp;&nbsp;累计消费满&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;元</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="center">
                <button class="btn btn-primary">保存</button>
                <button class="btn btn-default">取消</button>
            </div>
        </form>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_viplabel_new_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}