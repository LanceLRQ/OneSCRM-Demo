{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipmanage" %}
{% block db_title %}会员中心 - 会员详情{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_vipmember_edit_Controller">
        <h4 class="block">会员中心/会员详情 - kingswong</h4>
        <a href="{% url 'ent_board_vip_member_vipmanage_details' params.eid %}" style="float: right;margin-top: -25px">返回</a>
        <hr>
        <form >
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table table-noborder">
                    <tr>
                        <td width="100px"><img src="#" ></td>
                        <td  width="200px"><h4>KingsWong</h4></td>
                    </tr>
                    <tr>
                        <td>会员名</td>
                        <td ><input type="text"></td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td ><input type="text"></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td><input type="text" disabled="disabled"></td>
                    </tr>
                    <tr>
                        <td>电话</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>会员等级</td>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <td>会员卡号</td>
                        <td><input type="text" disabled="disabled"></td>
                    </tr>
                    <tr>
                        <td>微信ID</td>
                        <td><input type="text" disabled="disabled"></td>
                    </tr>
                    <tr>
                        <td>生日</td>
                        <td>
                            <div class="btn-group" uib-dropdown>
                                <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                    <span ng-bind="'年'"></span> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                    <li role="menuitem"></li>
                                </ul>
                            </div>
                            <div class="btn-group" uib-dropdown>
                                <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                    <span ng-bind="'月'"></span> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                    <li role="menuitem"></li>
                                </ul>
                            </div>
                            <div class="btn-group" uib-dropdown>
                                <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                    <span ng-bind="'日'"></span> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                    <li role="menuitem"></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>身份证号</td>
                        <td><input type="text" disabled="disabled"></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td><input type="text" disabled="disabled"></td>
                    </tr>
                </table>
                <div align="center">
                    <button type="submit" class="btn btn-primary">保 存</button>
                    <button type="reset" class="btn btn-default">取 消</button>
                </div>
            </div>
        </form>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_vipmember_edit_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}