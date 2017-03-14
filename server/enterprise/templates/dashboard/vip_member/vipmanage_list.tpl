{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.vip_member" %}
{% set board_nav_lv1 = "vip_member" %}
{% set board_nav_lv2 = "vipmanage" %}
{% block db_title %}会员管理 - 会员中心{% endblock %}
{% block db_nav_lv2 %}
    {% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_vipmanage_list_Controller">
        <h4 class="block">会员中心</h4>
        <hr>
        <form action="" class="form-inline">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="昵称/会员名/会员号/手机号"style="min-width: 300px">
                <div class="input-group-btn">
                    <div class="btn-group">
                        <a class="btn btn-primary" style="outline: none" type="button">搜索</a>
                        <a class="btn btn-default" style="outline: none" ng-click="selectShow()" type="button">高级搜索&nbsp;<span class="caret"></span></a>
                    </div>
                </div>
            </div>
        </form>
        <div class="panel panel-nav-primary" ng-show="opt">
            <br />
            <div class="panel-heading">
                <h3 class="panel-title">高级搜索</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-9">
                        <table border="0" class="table table-noborder">
                            <tr>
                                <td>按等级</td>
                                <td>
                                    <label for=""><input type="checkbox"> 全部</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 英勇小学生VI</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 英勇黄铜V</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 璀璨砖石II</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 最强王者</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 嘴强王者</label>
                                </td>
                            </tr>
                            <tr>
                                <td>按标签</td>
                                <td>
                                    <label for=""><input type="checkbox"> 全部</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 有钱</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 有技术</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 有钱而且傻</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 没钱还爱BB</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 不充钱玩你MB</label>&nbsp;&nbsp;
                                    <label for=""><input type="checkbox"> 皮肤控</label>&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>按积分</td>
                                <td>
                                    <div ng-repeat="item in integral" style="display: inline" ng-click="integralChange(item)">
                                        <a class="label"  ng-class="{'label-nocolor':!item.isClick,'label-primary':item.isClick}" ng-bind="item.value"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>按余额</td>
                                <td>
                                    <div ng-repeat="key in  remainder" style="display: inline" ng-click="reChange(key)">
                                        <a  ng-class=" {'label label-nocolor':!key.isClick,'label label-primary':key.isClick}" ng-bind="key.value"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>按活跃</td>
                                <td>
                                    <div class="btn-group btn-group-sm" ng-repeat="opt in active" ng-click="activeChange(opt)">
                                        <button ng-class="{'btn btn-default':!opt.isClick,'btn btn-primary':opt.isClick}" ng-bind="opt.value"></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>按性别</td>
                                <td>
                                    <div class="btn-group btn-group-sm" ng-repeat="x in sex" ng-click="sexChange(x)">
                                        <button ng-class="{'btn btn-default':!x.isClick,'btn btn-primary':x.isClick}" ng-bind="x.value"></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>按地区</td>
                                <td>
                                    <div class="btn-group" uib-dropdown>
                                        <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                            <span ng-bind="vipMemberInfo.province || '请选择'"></span> <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                            <li role="menuitem" ng-repeat="(key,val) in citys"><a ng-click="selectorChangeLBS('province', key, citys, 'citys_entity', 2)" ng-bind="key"></a></li>
                                        </ul>
                                    </div>
                                    <div class="btn-group" uib-dropdown>
                                        <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                            <span ng-bind="vipMemberInfo.city || '请选择'"></span> <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                            <li role="menuitem" ng-repeat="(key,val) in citys_entity"><a ng-click="selectorChangeLBS('city', key, citys_entity, 'district_entity', 1)" ng-bind="key"></a></li>
                                        </ul>
                                    </div>
                                    <div class="btn-group" uib-dropdown>
                                        <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                            <span ng-bind="vipMemberInfo.district || '请选择'"></span> <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                            <li role="menuitem" ng-repeat="val in district_entity"><a ng-click="selectorChangeLBS('district', val)" ng-bind="val"></a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-lg-3">
                        <table class="table table-noborder">
                            <tr>
                                <td colspan="3">按标签</td>
                            </tr>
                            <tr>
                                <td>
                                    <div ng-repeat="a in labeler1" style="display: inline" ng-click="labeler1Change(a.isClick,a.noClick)">
                                        <a href="" ng-class="{'label label-default':a.noClick,'label label-primary':a.isClick}" ng-bind="a.value"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div ng-repeat="b in labeler2" style="display: inline" ng-click="labeler2Change(b.isClick,b.noClick)">
                                        <a href="" ng-class="{'label label-default':b.noClick,'label label-primary':b.isClick}" ng-bind="b.value"></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div ng-repeat="c in labeler3" style="display: inline" ng-click="labeler3Change(c.isClick,c.noClick)">
                                        <a href="" ng-class="{'label label-default':c.noClick,'label label-primary':c.isClick}" ng-bind="c.value"></a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </div>
                </div>
            <div class="panel-footer">
                <button class="btn btn-primary">筛选</button>
                <button class="btn btn-default">清空</button>
                <button class="btn btn-default" ng-click="selectHide()">收起</button>
            </div>
        </div>
        <br>
        <div style="line-height:50px;">
            <div style="float: left">全部会员 人</div>
            <div style="float: right">
                <button class="btn btn-default btn-sm">刷新</button>
                <button class="btn btn-default btn-sm">导入</button>
                <button class="btn btn-default btn-sm">导出</button>
                <a href="#">下载模板</a>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div style="float: right">
                <button class="btn btn-primary btn-sm">打标签</button>
                <button class="btn btn-primary btn-sm">改等级</button>
                <button class="btn btn-primary btn-sm">冻结</button>
                <button class="btn btn-primary btn-sm">解冻</button>
                &nbsp;&nbsp;
            </div>
        </div>
        <br>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>昵称</th>
                <th>会员名</th>
                <th>会员号</th>
                <th>手机</th>
                <th>可用积分</th>
                <th>可用余额</th>
                <th>等级</th>
                <th>关注时间</th>
                <th>最后活跃时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td></td>
                <td>{{ vipMemberInfo.memberName }}</td>
                <td ng-bind="vipMemberInfo.vipCardNumber"></td>
                <td ng-bind="vipMemberInfo.phone"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td ng-bind="vipMemberInfo.recentActiveTime"></td>
                <td>
                    <a href="" class="label label-primary">标签</a>
                    <a href="{% url 'ent_board_vip_member_vipmanage_details' params.eid%}" class="label label-success">详情</a>
                    <a href="{% url 'ent_board_vip_member_vipmember_recordsPay' params.eid%}" class="label label-warning">记录</a>
                    <a href="" class="label label-danger">冻结</a>
                </td>
            </tr>
            </tbody>
        </table>
        <div align="center">
            <nav>
                <ul class="pagination pagination-sm">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>
        </div>
    </div>
{% endblock %}
{% block db_script %}
    <script type="text/javascript">
        var db_vip_member = angular.module('dashboard.vip_member',['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog','app.LoadingLayout']);
        db_vip_member.controller("Dashboard_vipmanage_list_Controller",['$scope','$http','myAlert','LoadingLayout',function($scope,$http,myAlert,LoadingLayout) {
            $scope.opt = false;
            var a;
            $scope.selectShow = function(){
                this.opt = true;
            };
            $scope.selectHide = function(){
                this.opt = false;
            };
            $scope.integral = [
                {value:'不限制',isClick:false},
                {value:'0~100',isClick:false},
                {value:'100~200',isClick:false},
                {value:'200~300',isClick:false},
                {value:'300~400',isClick:false},
                {value:'400~500',isClick:false},
                {value:'+ 自定义',isClick:false},
            ];
            $scope.remainder = [
                {value:'不限制',isClick:false},
                {value:'0~100',isClick:false},
                {value:'100~200',isClick:false},
                {value:'200~300',isClick:false},
                {value:'300~400',isClick:false},
                {value:'400~500',isClick:false},
                {value:'+ 自定义',isClick:false},
            ];
            $scope.active = [
                {value:'全部',isClick:false},
                {value:'高活跃',isClick:false},
                {value:'中活跃',isClick:false},
                {value:'低活跃',isClick:false},
                {value:'不活跃',isClick:false}
            ];
            $scope.sex = [
                {value:'全部',isClick:false},
                {value:'男',isClick:false},
                {value:'女',isClick:false},
                {value:'未知',isClick:false}
            ];
            $scope.labeler1 = [
                {value:'标签',isClick:false,noClick:true},
                {value:'标签',isClick:false,noClick:true},
                {value:'标签',isClick:false,noClick:true},
            ];
            $scope.labeler2 = [
                {value:'标签',isClick:false,noClick:true},
                {value:'标签',isClick:false,noClick:true},
                {value:'标签',isClick:false,noClick:true},
            ];
            $scope.labeler3 = [
                {value:'标签',isClick:false,noClick:true},
                {value:'标签',isClick:false,noClick:true},
                {value:'标签',isClick:false,noClick:true},
            ];
            $scope.integralChange = function (value1) {
                for(var i = 0; i < $scope.integral.length; i++)
                    $scope.integral[i].isClick = false;
                value1.isClick = !value1.isClick;

            };
            $scope.reChange = function (value1) {
                for(var i = 0; i < $scope.remainder.length; i++)
                    $scope.remainder[i].isClick = false;
                value1.isClick = !value1.isClick;

            };
            $scope.activeChange = function (value1) {
                for(var i = 0; i < $scope.active.length; i++)
                    $scope.active[i].isClick = false;
                value1.isClick = !value1.isClick;

            };
            $scope.sexChange = function (value1) {
                for(var i = 0; i < $scope.sex.length; i++)
                    $scope.sex[i].isClick = false;
                value1.isClick = !value1.isClick;

            };
            $scope.labeler1Change = function(value1,value2){
                this.a.isClick = !value1
                this.a.noClick = !value2
            };
            $scope.labeler2Change = function(value1,value2){
                this.b.isClick = !value1
                this.b.noClick = !value2
            };
            $scope.labeler3Change = function(value1,value2){
                this.c.isClick = !value1
                this.c.noClick = !value2
            };
            $http({
                cache:false,
                method:"POST",
                url: '{% url 'ent_board_vip_member_vipmanage' params.eid %}'
            }).then(function (response) {
                var result = response.data;
                if(result.errcode == 0){
                    LoadingLayout.hide();
                    $scope.vipMemberInfo = result.data.vipMemberInfo;
                    $scope.citys = result.data.citys;
                }else{
                    myAlert({
                        btn_ok_color: "danger",
                        title: '加载错误',
                        content: result.errmsg
                    }).show();
                }
                $scope.selectorChangeLBS = function (model, val, rawSelector, viewSelector, cleanLevel) {
                    if(cleanLevel != undefined) {
                        if (cleanLevel >= 2){
                            $scope.district_entity = "";
                            $scope.enterpriseInfo.district = "";
                        }
                        if (cleanLevel >= 1){
                            $scope.citys_entity = "";
                            $scope.enterpriseInfo.city = "";
                        }
                    }
                    $scope.enterpriseInfo[model] = val;
                    if(rawSelector != undefined && viewSelector != undefined){
                        $scope[viewSelector] =　rawSelector[val];
                    }
                };
            })
        }]);
    </script>
{% endblock %}