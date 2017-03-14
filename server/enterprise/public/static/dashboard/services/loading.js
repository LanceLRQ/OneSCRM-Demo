angular.module('app.LoadingLayout', ['ui.bootstrap'], function($provide) {
    $provide.factory('LoadingLayout', ['$rootScope', function ($rootScope) {
        return {
            show: function () {
                document.getElementById("dashboard_loading_layout").style.display = 'block';
            },
            hide: function () {
                document.getElementById("dashboard_loading_layout").style.display = 'none';
            },
            error: function () {
                document.getElementById("dashboard_loading_text").innerHTML = '<br />数据加载失败<br />请刷新页面重试';
                document.getElementById("dashboard_loading_image").style.display = 'none';
            }
        }
    }]);
});
