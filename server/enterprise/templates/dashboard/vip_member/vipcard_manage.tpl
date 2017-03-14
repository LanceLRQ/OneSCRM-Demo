{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipcard" %}
{% block db_title %}会员卡 - 创建会员卡{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body%}
    <div class="dashboard_container" ng-controller="Dashboard_vipcard_manage_Controller">
        <h4 class="block">会员卡</h4>
        <hr>
        <div style="padding: 20px 20px; line-height:30px;background-color: #b9def0">
            <span style="color: #00b3ee" style="display: inline">认证服务号(卡卷功能开启且类目符合要求),可开启原生会员卡&nbsp;</span>
            <button class="btn btn-primary btn-sm">尝试开启</button>
            <a class="btn btn-primary btn-sm" type="button" href="{% url 'ent_board_vip_member_vipcard_edit' params.eid %}">编辑会员卡</a>
            <p>注:选定后不可更改。新创建微信会员卡时无法导入已有会员数据&nbsp;&nbsp;&nbsp;<a href="">了解详情</a></p>
        </div>
       <div class="row">
           <div class="col-lg-5"></div>
           <div class="col-lg-7">
               <table class="table table-noborder" >
                   <tr>
                       <td colspan="3">
                           基本信息
                           <hr>
                       </td>
                   </tr>
                   <tr>
                       <td width="100">商户</td>
                       <td width="120"><img ng-src="{% raw %}{{ enterpriseInfo.logoUrl }}{% endraw %}" alt=""></td>
                       <td></td>
                   </tr>
                   <tr>
                       <td>会员卡标题</td>
                       <td ng-bind="vipCardInfo.cardTitle"></td>
                   </tr>
               </table>
               <br>
               <table class="table table-noborder" >
                   <tr>
                       <td colspan="3">
                           会员卡详情
                           <hr>
                       </td>
                   </tr>
                   <tr>
                       <td width="100">特权介绍</td>
                       <td ng-bind="vipCardInfo.vipBenefit" colspan="2"></td>
                   </tr>
                   <tr>
                       <td width="100">使用须知</td>
                       <td colspan="2" ng-bind="vipCardInfo.readMe"></td>
                   </tr>
               </table>
               <br>
               <table class="table table-noborder" >
                   <tr>
                       <td colspan="3">
                           激活设置
                           <hr>
                       </td>
                   </tr>
                   <tr>
                       <td width="100">激活方式</td>
                       <td colspan="2"></td>
                   </tr>
                   <tr>
                       <td>会员资料</td>
                       <td colspan="2">
                           <table class="table table-noborder">
                               <table class="table">
                                   <thead>
                                   <th>信息名称</th>
                                   <th>是否必填</th>
                                   </thead>
                                   <tbody>
                                   <tr ng-show="vipCardInfo.isPhone">
                                       <td>手机号</td>
                                       <td>
                                           <div ng-show="vipCardInfo.isPhoneNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isPhoneNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   <tr ng-show="vipCardInfo.isName">
                                       <td>姓名</td>
                                       <td>
                                           <div ng-show="vipCardInfo.isNameNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isNameNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   <tr ng-show="vipCardInfo.isSex">
                                       <td>性别</td>
                                       <td>
                                           <div ng-show="vipCardInfo.isSexNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isSexNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   <tr ng-show="vipCardInfo.isBirthday">
                                       <td>生日</td></td>
                                       <td>
                                           <div ng-show="vipCardInfo.isBirthdayNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isBirthdayNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   <tr ng-show="vipCardInfo.isMail">
                                       <td>邮箱</td>
                                       <td>
                                           <div ng-show="vipCardInfo.isMailNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isMailNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   <tr ng-show="vipCardInfo.isAddress">
                                       <td>详细地址</td>
                                       <td>
                                           <div ng-show="vipCardInfo.isAddressNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isAddressNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   <tr ng-show="vipCardInfo.isIdcard">
                                       <td>身份证号</td>
                                       <td>
                                           <div ng-show="vipCardInfo.isIdcardNecessary">必填</div>
                                           <div ng-hide="vipCardInfo.isIdcardNecessary">可不填</div>
                                       </td>
                                   </tr>
                                   </tbody>
                               </table>
                           </table>
                       </td>
                   </tr>
               </table>
               <br>
               <table class="table table-noborder" >
                   <tr>
                       <td colspan="3">
                           功能设置
                           <hr>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="3">
                           <div ng-show="vipCardInfo.canRecharge">支持手机端充值</div>
                           <div ng-hide="vipCardInfo.canRecharge">不支持手机端充值</div>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="3">
                           <div ng-show="vipCardInfo.canConsume">支持手机端付款</div>
                           <div ng-hide="vipCardInfo.canConsume">不支持手机端付款</div>
                       </td>
                   </tr>
               </table>
           </div>
       </div>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_memeber = angular.module('dashboard.vip_member',['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog','app.LoadingLayout']);
        db_vip_memeber.controller("Dashboard_vipcard_manage_Controller",['$scope','$http','myAlert','LoadingLayout',function ($scope,$http,myAlert,LoadingLayout) {
            $http({
                cache: false,
                method: 'POST',
                url: '{% url 'ent_board_vip_member_vipcard_manage' params.eid %}'
            }).then(function (response) {
                var result = response.data;
                if(result.errcode == 0){
                    LoadingLayout.hide();
                    $scope.vipCardInfo = result.data.vipCardInfo;
                    $scope.enterpriseInfo = result.data.enterpriseInfo;
                }else{
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