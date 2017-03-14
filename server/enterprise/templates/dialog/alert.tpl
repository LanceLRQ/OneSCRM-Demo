<div>
    <div class="modal-header">
        <h4 class="modal-title text-{% raw %}{{ btn_ok_color }}{% endraw %}" ng-bind="title">
        </h4>
    </div>
    <div class="modal-body">
        <div class="text-{% raw %}{{ btn_ok_color }}{% endraw %}" ng-bind-html="content"></div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-{% raw %}{{ btn_ok_color }}{% endraw %}" ng-bind="btn_ok" ng-click="btn_ok_func()"></button>
    </div>
</div>