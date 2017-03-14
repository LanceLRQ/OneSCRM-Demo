<div>
    <div class="modal-header">
        <h4 class="modal-title" ng-bind="title">
        </h4>
    </div>
    <div class="modal-body">
        <div ng-include src="templateUrl"></div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" ng-bind="btn_cancel" ng-show="btn_cancel" ng-click="btn_cancel_func()"></button>
        <button type="button" class="btn btn-{% raw %}{{ btn_ok_color }}{% endraw %}" ng-bind="btn_ok" ng-show="btn_ok" ng-click="btn_ok_func()"></button>
    </div>
</div>