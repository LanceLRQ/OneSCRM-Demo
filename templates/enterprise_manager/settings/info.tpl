<div class="tab-container">
    <div style="float: right; margin-left: 10px;">
        <img src="{% raw %}{{ enterpriseInfo.logoUrl }}{% endraw %}" width="80" height="80" border="1">
    </div>
    <form class="form-group" ng-submit="save()">
        <div class="input-group">
            <div class="input-group-addon">商家名称</div>
            <input type="text" ng-model="enterpriseInfo.enterpriseName" class="form-control">
        </div><br /><br />
        <div class="input-group">
            <div class="input-group-addon">商家Logo</div>
            <input type="text" ng-model="enterpriseInfo.logoUrl" class="form-control" readonly>
        </div><br /><br />
        <div class="input-group">
            <div class="input-group-addon">经营类型</div>
            <div class="form-control">
                <select type="text" ng-model="enterpriseInfo.type1">
                    <option value="{% raw %}{{ item.value }}{% endraw %}" ng-repeat="item in enterpriseInfo.type1_selector">{% raw %}{{ item.text }}{% endraw %}</option>
                </select>
                <select type="text" ng-model="enterpriseInfo.type2">
                    <option value="{% raw %}{{ item.value }}{% endraw %}" ng-repeat="item in enterpriseInfo.type2_selector">{% raw %}{{ item.text }}{% endraw %}</option>
                </select>
            </div>
        </div><br /><br />
        <div class="input-group">
            <div class="input-group-addon">联 系 人</div>
            <input type="text" ng-model="enterpriseInfo.contactName" class="form-control">
        </div><br /><br />
        <div class="input-group">
            <div class="input-group-addon">联系电话</div>
            <input type="text" ng-model="enterpriseInfo.contactTel" class="form-control">
        </div><br /><br />
        <div class="input-group">
            <div class="input-group-addon">所属区域</div>
            <div class="form-control">
                <select type="text" ng-model="enterpriseInfo.province">
                </select>
                <select type="text" ng-model="enterpriseInfo.city">
                </select>
                <select type="text" ng-model="enterpriseInfo.district">
                </select>
            </div>
        </div><br /><br />
        <div class="input-group">
            <div class="input-group-addon">详细地址</div>
            <input type="text" ng-model="enterpriseInfo.address" class="form-control" size="40">
        </div><br /><br />
        <input type="hidden" ng-model="enterpriseInfo.longitude">
        <input type="hidden" ng-model="enterpriseInfo.latitude">
        <hr>
        <div align="center"><button type="submit" class="btn btn-success">保 存</button></div>
    </form>
</div>