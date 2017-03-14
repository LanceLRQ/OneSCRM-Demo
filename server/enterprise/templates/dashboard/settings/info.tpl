{% extends "../dashboard.tpl" %}
{% set ng_app = "dashboard.settings" %}
{% set board_nav_lv1 = "settings" %}
{% set board_nav_lv2 = "info" %}
{% block db_title %}商家信息 - 设置{% endblock %}
{% block db_nav_lv2 %}
{% include "nav.tpl" %}
{% endblock %}
{% block db_body %}
    <div class="dashboard_container" ng-controller="Dashboard_settings_info_Controller">
        <h4 class="block">商家信息</h4>
        <hr>
        <form class="form-inline" ng-submit="save()">
            <table class="table table-noborder">
                <tbody>
                <tr>
                    <td width="80">商家名称</td>
                    <td><input type="text" ng-model="enterpriseInfo.enterpriseName" class="form-control" size="40"></td>
                </tr>
                <tr>
                    <td>商家Logo</td>
                    <td>
                        <img ng-src="{% raw %}{{ enterpriseInfo.logoUrl }}{% endraw %}" width="80" height="80" border="1">
                        <button class="btn btn-default">上传图片</button>
                        图片建议尺寸：300像素x300像素。仅支持.jpg .jpeg .bmp .png格式正方形照片，大小不超过5M。
                        <input type="hidden" ng-model="enterpriseInfo.logoUrl">
                    </td>
                </tr>
                <tr>
                    <td>经营类型</td>
                    <td>
                        <div class="btn-group" uib-dropdown>
                            <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                <span ng-bind="enterpriseInfo.type1 || '请选择'"></span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                <li role="menuitem" ng-repeat="opt in type1Selectors"><a ng-click="selectorChange('type1', opt, type2Selectors, 'type2SelectorsEntity', 1)" ng-bind="opt"></a></li>
                            </ul>
                        </div>
                        <div class="btn-group" uib-dropdown>
                            <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                <span ng-bind="enterpriseInfo.type2 || '请选择'"></span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                <li role="menuitem" ng-repeat="opt in type2SelectorsEntity"><a ng-click="selectorChange('type2', opt)" ng-bind="opt"></a></li>
                            </ul>
                        </div>
                        <input type="hidden" ng-model="enterpriseInfo.type1">
                        <input type="hidden" ng-model="enterpriseInfo.type2">
                    </td>
                </tr>
                <tr>
                    <td>联系人</td>
                    <td><input type="text" ng-model="enterpriseInfo.contactName" class="form-control" size="40"></td>
                </tr>
                <tr>
                    <td>联系电话</td>
                    <td><input type="text" ng-model="enterpriseInfo.contactTel" class="form-control" size="40"></td>
                </tr>
                <tr>
                    <td>所属区域</td>
                    <td>
                        <div class="btn-group" uib-dropdown>
                            <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                <span ng-bind="enterpriseInfo.province || '请选择'"></span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                <li role="menuitem" ng-repeat="(key,val) in citys"><a ng-click="selectorChangeLBS('province', key, citys, 'citys_entity', 2)" ng-bind="key"></a></li>
                            </ul>
                        </div>
                        <div class="btn-group" uib-dropdown>
                            <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                <span ng-bind="enterpriseInfo.city || '请选择'"></span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                <li role="menuitem" ng-repeat="(key,val) in citys_entity"><a ng-click="selectorChangeLBS('city', key, citys_entity, 'district_entity', 1)" ng-bind="key"></a></li>
                            </ul>
                        </div>
                        <div class="btn-group" uib-dropdown>
                            <button id="single-button" type="button" class="btn btn-default" uib-dropdown-toggle>
                                <span ng-bind="enterpriseInfo.district || '请选择'"></span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" uib-dropdown-menu role="menu">
                                <li role="menuitem" ng-repeat="val in district_entity"><a ng-click="selectorChangeLBS('district', val)" ng-bind="val"></a></li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>详细地址</td>
                    <td>
                        <input type="text" ng-model="enterpriseInfo.address" class="form-control" size="60">
                        <button type="button" class="btn btn-default" ng-click="getPos()">浏览器定位</button>
                        <button type="button" class="btn btn-default" ng-click="searchMap()">搜索</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><div id="map_container" style="width: 600px; height: 400px;"></div>  </td>
                </tr>
                </tbody>
            </table>
            <input type="hidden" ng-model="enterpriseInfo.longitude">
            <input type="hidden" ng-model="enterpriseInfo.latitude">
            <hr>
            <div align="center">
                <button type="submit" class="btn btn-primary">保 存</button>
                <button type="reset" class="btn btn-default">取 消</button>
            </div>
        </form>
    </div>
{% endblock %}
{% block db_script %}
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=bad31b670b2318047b14fd0bd4b44646"></script>
<script type="text/javascript">
    /*高德地图接入*/
    var map = new AMap.Map('map_container', {
        resizeEnable: true
    });
    var geocoder  = null;
    map.plugin('AMap.Geocoder', function() {
        geocoder = new AMap.Geocoder({
            radius: 1000,
            extensions: "all"
        });
    });
    var defLngLat = map.getCenter();
    var marker =  new AMap.Marker({
        icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
        position: [defLngLat.getLng(), defLngLat.getLat()]
    });
    marker.setMap(map);
    /*注册Angularjs控制器*/
    var db_settings = angular.module('dashboard.settings', ['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog', 'app.LoadingLayout']);
    db_settings.controller("Dashboard_settings_info_Controller", ["$scope", "$http", 'myAlert', 'LoadingLayout', function ($scope, $http, myAlert, LoadingLayout) {
        LoadingLayout.show();
        $http({
            cache: false,
            method: "POST",
            url: '{% url 'ent_board_settings_info' params.eid %}'
        }).then(function (response) {
            var result = response.data;
            if(result.errcode == 0){
                LoadingLayout.hide();
                $scope.enterpriseInfo = result.data.entInfo;
                $scope.type1Selectors = result.data.type1Selectors;
                $scope.type2Selectors = result.data.type2Selectors;
                $scope.citys = result.data.citys;
                if($scope.enterpriseInfo.longitude != undefined && $scope.enterpriseInfo.latitude != undefined){
                    var pos = new AMap.LngLat($scope.enterpriseInfo.longitude, $scope.enterpriseInfo.latitude);
                    marker.setPosition(pos);
                    map.setCenter(pos);
                }
            }else{
                LoadingLayout.error();
                myAlert({
                    btn_ok_color: "danger",
                    title: '加载错误',
                    content: result.errmsg
                }).show();
            }
        });

        // 初始化地图点击事件
        AMap.event.addListener(map, "click", function(e) {
            marker.setPosition(e.lnglat);
            $scope.enterpriseInfo.longitude = e.lnglat.getLng();
            $scope.enterpriseInfo.latitude = e.lnglat.getLat();
            geocoder.getAddress([e.lnglat.getLng(), e.lnglat.getLat()], function(status, result) {
                if (status === 'complete' && result.info === 'OK') {
                    $scope.enterpriseInfo.address = result.regeocode.formattedAddress;
                    $scope.$apply();
                }
            });
        });
        $scope.getPos = function () {
            map.plugin('AMap.Geolocation', function() {
                geolocation = new AMap.Geolocation({
                    enableHighAccuracy: true,//是否使用高精度定位，默认:true
                    timeout: 10000,          //超过10秒后停止定位，默认：无穷大
                    buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
                    zoomToAccuracy: true,      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
                    buttonPosition:'RB',
                    showCircle: false,
                    showMarker: false
                });
                map.addControl(geolocation);
                map.setZoom(17);
                geolocation.getCurrentPosition();
            });
        };
        $scope.searchMap = function () {
            AMap.service(["AMap.PlaceSearch"], function() {
                var placeSearch = new AMap.PlaceSearch({ //构造地点查询类
                    pageSize: 5,
                    pageIndex: 1,
                    map: map
                });
                //关键字查询
                placeSearch.search($scope.enterpriseInfo.address);
            });
        };

        $scope.selectorChange = function (model, val, rawSelector, viewSelector, cleanLevel) {
            if (cleanLevel >= 1){
                $scope.enterpriseInfo.type2 = "";
            }
            $scope.enterpriseInfo[model] = val;
            if(rawSelector != undefined && viewSelector != undefined){
                $scope[viewSelector] =　rawSelector[val];
            }
        };
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
        $scope.save = function () {
            $http({
                cache: false,
                method: "POST",
                data: $scope.enterpriseInfo,
                url: '{% url 'ent_board_settings_info_save' params.eid %}'
            }).then(function (response) {
                var data = response.data;
                if(data.errcode == 0){
                    myAlert({
                        btn_ok_color: "success",
                        title: '操作成功',
                        content: '商家资料更新成功'
                    }).show();
                }else{
                    myAlert({
                        btn_ok_color: "danger",
                        title: '操作失败',
                        content: data.errmsg
                    }).show();
                }
            });
        }
    }]);
</script>
{% endblock %}