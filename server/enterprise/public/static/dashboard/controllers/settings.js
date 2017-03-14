var db_settings = angular.module('dashboard.settings', ['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog']);

db_settings.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/info");
    $stateProvider.state('info', {
        url: '/info',
        views: {
            'emgr_settings': {
                templateUrl: '/emgr/settings/info.tpl',
                controller: 'Emgr_settings_info_Controller'
            }
        }
    })
});

db_settings.controller("Dashboard_settings_info_Controller", ["$scope", "$http", 'myAlert', function ($scope, $http, myAlert) {
    $http({
        cache: false,
        method: "GET",
        url: '/emgr/settings/info'
    }).then(function (response) {
        var data = response.data;
        if(data.flag){
            $scope.enterpriseInfo = data.data;
        }else{
            myAlert({
                btn_ok_color: "danger",
                title: '加载错误',
                content: data.msg
            }).show();
        }
    });
    $scope.save = function () {
        $http({
            cache: false,
            method: "POST",
            data: $scope.enterpriseInfo,
            url: '/emgr/settings/info/save'
        }).then(function (response) {
            var data = response.data;
            if(data.flag){
                myAlert({
                    btn_ok_color: "success",
                    title: '操作成功',
                    content: data.msg
                }).show();
            }else{
                myAlert({
                    btn_ok_color: "danger",
                    title: '操作失败',
                    content: data.msg
                }).show();
            }
        });
    }
}]);


