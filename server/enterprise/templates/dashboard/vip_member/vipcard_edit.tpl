{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipcard" %}
{% block db_title %}会员卡 - 创建会员卡{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_vipcard_edit_Controller">
        <h4 class="block">会员卡/编辑会员卡</h4>
        <hr>
        <form  class="form-inline" ng-submit="save()">
            <table class="table table-noborder" ng-show="nextValue">
                <tbody>
                <tr>
                    <td colspan="3">
                        基本信息
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td >商户</td>
                    <td><img ng-src="{% raw %}{{ enterpriseInfo.logoUrl }}{% endraw %}" alt=""></td>
                    <td >如需修改商户信息，请在<a href="{% url 'ent_board_settings_info' params.eid %}">商户设置</a>中操作。</td>
                </tr>
                <tr>
                    <td>会员卡标题</td>
                    <td><input type="text" ng-model="vipCardInfo.cardTitle" class="form-control"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>微信会员卡</td>
                    <td><input type="checkbox" ng-model="vipCardInfo.wxStatus">开启支持</td>
                    <td>仅支持开通卡卷功能的认证服务号</td>
                </tr>
                <tr>
                    <td>会员卡颜色</td>
                    <td colspan="2">
                        <div style="float: left">
                            <div style="background-color: #63b359;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color010" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #2c9f67;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color020" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #509fc9;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color030" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #5885cf;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color040" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #9062c0;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color050" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #d09a45;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color060" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #e4b138;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color070" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #ee903c;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color080" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #dd6549;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color090" style="margin-left: 8px">
                        </div>
                        <div style="float: left">
                            <div style="background-color: #cc463d;" class="colorSelect"></div>
                            <input type="radio"  name="colorid" ng-model="vipCardInfo.colorId" value="Color100" style="margin-left: 8px">
                        </div>
                    </td>
                </tr>
                <tr></tr>
                <tr>
                    <td >默认卡面</td>
                    <td colspan="2">请参照<a href="#">图片规范</a> 上传,请上传小于1M的图片</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">默认卡面
                        &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-primary glyphicon glyphicon-open" type="button">上传图片</button>
                        &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-primary glyphicon glyphicon-trash" type="button">删除</button>
                    </td>
                </tr>
                <tr>
                    <td ></td>
                    <td> <button class="btn btn-primary glyphicon glyphicon-plus" type="button">添加自定义卡面</button></td>
                    <td>可根据会员等级配置不同的卡面图片</td>
                </tr>
                <tr>
                <tr>
                    <td colspan="4">
                        会员卡详情
                        <hr>
                    </td>
                </tr>
                </tr>
                <tr>
                    <td>会员权益:</td>
                    <td><textarea class="form-control" style="width: 200px;" ng-model="vipCardInfo.vipBenefit"></textarea></td>
                    <td style="font-size: 10px;">
                        例如：<br>
                        XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        <br>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        <br>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                    </td>
                </tr>
                <tr>
                    <td >使用须知:</td>
                    <td><textarea class="form-control" style="width: 200px;" ng-model="vipCardInfo.readMe"></textarea></td>
                    <td style="font-size: 10px;">
                        例如：<br>
                        XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        <br>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                        <br>XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                    </td>
                </tr>
                <tr>
                    <td>适用门店:</td>
                    <td colspan="2">
                        <input type="radio" name="suitable" id="Radios1" value="option1"> 全部门店适用
                        &nbsp;
                        <input type="radio" name="suitable" id="Radios2" value="option2" checked> 指定本店使用
                        &nbsp;
                        <a href="#" class="glyphicon glyphicon-plus">添加适用门店</a>
                    </td>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <table style="background-color: silver" border="1px">
                            <tr>
                                <td width="200">门店名称</td>
                                <td width="200">地址</td>
                                <td width="150">操作</td>
                            </tr>
                            <tr ng-repeat="opt in store_list">
                                <td ng-bind="opt.storeName"></td>
                                <td ng-bind="opt.address"></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </tr>
                </tbody>
            </table>
            <div align="center" ng-show="nextValue">
                <hr>
                <button type="button" class="btn btn-primary" ng-click="next()">下一步</button>
            </div>
            <table class="table table-noborder" ng-show="!nextValue">
                <tr>
                    <td colspan="3">
                        激活设置
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td>激活方式</td>
                    <td colspan="2">
                        <input type="radio" ng-click="free()" name="card" ng-model="vipCardInfo.activeWay" value="2"> 免费领卡
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" ng-click="pay()" name="card"  ng-model="vipCardInfo.activeWay" value="1"> 付费领卡
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" ng-show="chk">
                        市场价
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" ng-model="vipCardInfo.marketPrice">
                        元
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        售价
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" ng-model="vipCardInfo.realPrice">
                        元
                    </td>
                </tr>
                <tr>
                    <td>会员资料</td>
                    <td>
                        <table class="table">
                            <thead>
                            <tr>
                                <th width="150px"><b>信息名称</b></th>
                                <th width="150px"><b>启用</b></th>
                                <th width="100px"><b>必填</b></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>手机号</td>
                                <td>
                                    <input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isPhone">
                                </td>
                                <td>
                                    <input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isPhoneNecessary">
                                </td>
                            </tr>
                            <tr>
                                <td>姓名</td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isName"></td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isNameNecessary"></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isSex"></td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isSexNecessary"></td>
                            </tr>
                            <tr>
                                <td>生日</td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isBirthday"></td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isBirthdayNecessary"></td>
                            </tr>
                            <tr>
                                <td>邮箱</td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isMail"></td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isMailNecessary"></td>
                            </tr>
                            <tr>
                                <td>详细地址</td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isAddress"></td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isAddressNecessary"></td>
                            </tr>
                            <tr>
                                <td>身份证号</td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isIdcard"></td>
                                <td><input type="checkbox"  class="mui-switch" style="outline: none" ng-model="vipCardInfo.isIdcardNecessary"></td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        功能设置
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        充值功能
                        &nbsp;&nbsp;
                        <input type="checkbox" ng-model="vipCardInfo.canRecharge">
                        提供客户手机端充值功能
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        消费功能
                        &nbsp;&nbsp;
                        <input type="checkbox" ng-model="vipCardInfo.canConsume">
                        提供客户手机端消费功能
                    </td>
                </tr>
            </table>
            <div align="center" ng-show="!nextValue">
                <hr>
                <button type="submit" class="btn btn-primary">保存</button>
                <button type="button" class="btn btn-primary" ng-click="up()">上一步</button>
            </div>
        </form>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog','app.LoadingLayout']);
        db_vip_member.controller("Dashboard_vipcard_edit_Controller",['$scope','$http','myAlert','LoadingLayout',function($scope,$http,myAlert,LoadingLayout){
            $http({
                cache: false,
                method: 'POST',
                url: '{% url 'ent_board_vip_member_vipcard_edit' params.eid %}'
            }).then(function (response) {
                var result = response.data;
                if(result.errcode == 0){
                    LoadingLayout.hide();
                    $scope.vipCardInfo = result.data.vipCardInfo;
                    $scope.storeList = result.data.storeList;
                    $scope.enterpriseInfo = result.data.enterpriseInfo;
                }else{
                    myAlert({
                        btn_ok_color: "danger",
                        title: '加载错误',
                        content: result.errmsg
                    }).show();
                }
            });
            $scope.free = function (value) {
                this.chk = false;
            };
            $scope.pay = function (value) {
                this.chk = true;
            };
            $scope.nextValue = true;
            $scope.next = function () {
                this.nextValue = false;
            };
            $scope.up = function () {
                this.nextValue = true;
            };
            $scope.save = function () {
                $http({
                    cache: false,
                    method: "POST",
                    data: $scope.vipCardInfo,
                    url: '{% url 'ent_board_vip_member_vipcard_edit_save' params.eid %}'
                }).then(function (response) {
                    var data = response.data;
                    if(data.errcode == 0){
                        myAlert({
                            btn_ok_color: "success",
                            title: '操作成功',
                            content: '会员卡设置成功',
                            callback: function () {
                                window.location.href='{% url 'ent_board_vip_member_vipcard_manage' params.eid %}'
                            }
                        }).show();
                    }else{
                        myAlert({
                            btn_ok_color: "danger",
                            title: '操作失败',
                            content: data.errmsg
                        }).show();
                    }
                });
            };
        }])
    </script>
{% endblock %}