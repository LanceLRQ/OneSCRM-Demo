angular.module('app.MyDialog', ['ui.bootstrap'], function($provide){
    $provide.factory('myDialog', ['$rootScope', '$uibModal', function($rootScope, $uibModal){
        var default_options = {
            title: "Modal Box",
            btn_ok:"确定",
            btn_cancel:'取消',
            btn_ok_color: 'primary',
            callback: function ($scope) {
                return true;
            },
            size: "mid",
            animation: true,
            templateUrl: 'empty.tpl',
            controller: function ($scope) {

            }
        };
        return function(option) {
            var options = angular.extend(default_options, option);
            return {
                show: function () {
                    $uibModal.open({
                        size: options.size,
                        backdrop: 'static',
                        templateUrl: '/templates/dialog/window.tpl',
                        controller: function ($scope, $uibModalInstance) {
                            $scope.title = options.title;
                            $scope.templateUrl = options.templateUrl;
                            $scope.btn_ok =options.btn_ok;
                            $scope.btn_cancel = options.btn_cancel;
                            $scope.btn_ok_color = options.btn_ok_color;
                            $scope.btn_cancel_func = function () {
                                $uibModalInstance.close(false);
                            };
                            $scope.btn_ok_func = function () {
                                if(options.callback($scope)) {
                                    $uibModalInstance.close(false);
                                }
                            };
                        }
                    });
                }
            }
        }
    }]);
    $provide.factory('myAlert', ['$rootScope', '$uibModal', function($rootScope, $uibModal){
        var default_options = {
            title: "Modal Alert",
            size: "sm",
            animation: true,
            content: "",
            btn_ok_color: 'warning',
            callback: function ($scope) {

            },
            controller: function ($scope) {

            }
        };
        return function(option) {
            var options = angular.extend(default_options, option);
            return {
                show: function () {
                    $uibModal.open({
                        size: options.size,
                        backdrop: 'static',
                        templateUrl: '/templates/dialog/alert.tpl',
                        controller: function ($scope, $uibModalInstance, $sce) {
                            $scope.title = options.title;
                            $scope.content = $sce.trustAsHtml(options.content);
                            $scope.btn_ok = "确定";
                            $scope.btn_ok_color = options.btn_ok_color;
                            $scope.btn_ok_func = function () {
                                $uibModalInstance.close(false);
                                options.callback($scope);
                            };
                        }
                    });
                }
            }
        }
    }]);
    $provide.factory('myConfirm', ['$rootScope', '$uibModal', function($rootScope, $uibModal){
        var default_options = {
            title: "Modal Confirm",
            size: "sm",
            animation: true,
            content: "",
            btn_ok_color: 'warning',
            callback: function (status, $scope) {

            },
            controller: function ($scope) {

            }
        };
        return function(option) {
            var options = angular.extend(default_options, option);
            return {
                show: function () {
                    $uibModal.open({
                        size: options.size,
                        backdrop: 'static',
                        templateUrl: '/templates/dialog/confirm.tpl',
                        controller: function ($scope, $uibModalInstance, $sce) {
                            $scope.title = options.title;
                            $scope.content = $sce.trustAsHtml(options.content);
                            $scope.btn_ok = "是";
                            $scope.btn_cancel = "否";
                            $scope.btn_ok_color = options.btn_ok_color;
                            $scope.btn_ok_func = function () {
                                $uibModalInstance.close(false);
                                options.callback(true, $scope);
                            };
                            $scope.btn_cancel_func = function () {
                                $uibModalInstance.close(false);
                                options.callback(false, $scope);
                            };
                        }
                    });
                }
            }
        }
    }]);
});

// myDialog({
//     templateUrl:"/emgr/settings/info.tpl"
// }).show();
// myAlert({
//     title: "温馨提示",
//     content: "您的智商不足，请及时充值"
// }).show();
// myConfirm({
//     title: "温馨提示",
//     content: "您的智商不足，请及时充值",
//     callback: function (status, $scope) {
//         if(status){
//             console.log('你有钱？');
//         }else{
//             console.log('不充钱玩你妈比');
//         }
//     }
// }).show();
