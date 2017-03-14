{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipmanage" %}
{% block db_title %}会员管理 - 会员详情{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_vipmanage_details_Controller">
        <h4 class="block">会员中心/会员详情 - Kingswwong</h4>
        <a href="{% url 'ent_board_vip_member_vipmanage' params.eid %}" style="float: right;margin-top: -25px">返回</a>
        <hr>
        <div>
            基本信息
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <img src="#">
            </div>
            <div class="col-lg-10">
                <table class="table table-noborder">
                    <tr>
                        <td colspan="3">
                            <h4>微信名称:Kingswwong</h4>
                            备注名称:miko
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            使用状态:正在使用
                        </td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td>手机号</td>
                        <td>生日</td>
                    </tr>
                    <tr>
                        <td>会员类别</td>
                        <td>ID账号</td>
                        <td>证件号码</td>
                    </tr>
                    <tr>
                        <td>wechatid</td>
                        <td>地址</td>
                        <td>来源</td>
                    </tr>
                </table>
                <div align="left">
                    <a href="{% url 'ent_board_vip_member_vipmember_edit' params.eid %}" class="btn btn-primary btn-sm">修改信息</a>
                </div>
            </div>
        </div>
        <div>
            标签
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-offset-2 col-lg-8">
                <table class="table table-noborder">
                    <tr>
                        <td><a  class="label label-primary">标签</a></td>
                        <td><a  class="label label-primary">标签</a></td>
                        <td><a  class="label label-primary">标签</a></td>
                        <td><a  class="label label-primary">标签</a></td>
                        <td><a  class="label label-primary">标签</a></td>

                    </tr>
                </table>
            </div>
        </div>
        <div>
            账户信息
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-10 col-lg-offset-2">
                <table class="table table-noborder">
                    <tr>
                        <td>账户积分</td>
                        <td></td>
                        <td>账户余额</td>
                        <td></td>
                        <td>累积消费</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>累计积分</td>
                        <td></td>
                        <td>累计充值</td>
                        <td></td>
                        <td>消费次数</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>关注时间</td>
                        <td></td>
                        <td>领卡时间</td>
                        <td></td>
                        <td>上次消费时间</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="6">会员导入时间</td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            资产信息
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-10 col-lg-offset-2">
                <table class="table table-noborder">
                    <tr>
                        <td>可用资产</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>正在参与</td>
                        <td colspan="3"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['app.LoadingLayout']);
        db_vip_member.controller("Dashboard_vipmanage_details_Controller",['LoadingLayout',function(LoadingLayout) {
            LoadingLayout.hide();
        }]);
    </script>
{% endblock %}