var emgr_vip_member = angular.module('app.emgr_vip_member', ['ui.router','ui.router.util', 'ui.bootstrap','app.MyDialog']);

emgr_vip_member.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/info");
    $stateProvider.state('info', {
        url: '/info',
        views: {
            'emgr_vip_member': {
                templateUrl: '/emgr/vip_member/vip_card.tpl',
                controller: 'Emgr_vip_card_Controller'
            }
        }
    })
});

emgr_vip_member.controller("Emgr_vip_member_Controller", ["$scope", function ($scope) {

}]);

emgr_vip_member.controller("Emgr_vip_card_Controller", ["$scope", "$http", 'myAlert', function ($scope, $http, myAlert) {
    $http({
        cache: false,
        method: "GET",
        url: '/emgr/vip_member/vip_card'
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

}]);


