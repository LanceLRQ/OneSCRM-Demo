{% extends "base.tpl" %}
{% set left_nav = "profile" %}
{% block base_title %}商户概况{% endblock %}
{% block base_body %}
    <div id="profile_welcome_info">Hoiofino，下午好！</div>
    {#<div id="profile_ad_banner">我是可爱的广告占位符</div>#}
    <hr>
    <div class="row">
        <div class="col-md-2 profile_counter_item">
            <h1>10</h1>
            昨日新增粉丝
        </div>
        <div class="col-md-2 profile_counter_item">
            <h1>10</h1>
            昨日新增会员
        </div>
        <div class="col-md-2 profile_counter_item">
            <h1>1000</h1>
            昨日充值
        </div>
        <div class="col-md-2 profile_counter_item">
            <h1>1000</h1>
            昨日消费额
        </div>
        <div class="col-md-2 profile_counter_item">
            <h1>2333</h1>
            总粉丝数
        </div>
        <div class="col-md-2 profile_counter_item">
            <h1>233</h1>
            总会员数
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title">最新公告</div>
                </div>
                <div class="list-group">
                    <a href="" class="list-group-item">【系统公告】新功能上线啦<span class="badge">7-20 13:14</span></a>
                    <a href="" class="list-group-item">【应用公告】应用功能也上线啦<span class="badge">7-10 23:33</span></a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title"><span class="glyphicon glyphicon-comment"></span> 昨日消息数据</div>
                </div>
                <table class="table panel-body">
                    <tr>
                        <td width="33.3%">收消息</td>
                        <td width="33.3%">16,881</td>
                        <td width="33.3%"><span class="glyphicon glyphicon-arrow-up" style="color:#0f6;"></span> 61.9%</td>
                    </tr>
                    <tr>
                        <td>发消息</td>
                        <td>139</td>
                        <td><span class="glyphicon glyphicon-arrow-up" style="color:#0f6;"></span> 26.4%</td>
                    </tr>
                    <tr>
                        <td>互动人数</td>
                        <td>8,446</td>
                        <td><span class="glyphicon glyphicon-arrow-up" style="color:#0f6;"></span> 102%</td>
                    </tr>
                </table>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-title"><span class="glyphicon glyphicon-comment"></span> 昨日粉丝数据</div>
                </div>
                <table class="table panel-body">
                    <tr>
                        <td width="33.3%">新增</td>
                        <td width="33.3%">994</td>
                        <td width="33.3%"><span class="glyphicon glyphicon-arrow-down" style="color:#c00;"></span> 7.1%</td>
                    </tr>
                    <tr>
                        <td>取消关注</td>
                        <td>1,661</td>
                        <td><span class="glyphicon glyphicon-arrow-up" style="color:#0f6;"></span> 726.4%</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <hr>
    <h2>常用功能</h2>
    <button class="btn btn-success btn-lg">微信</button>&nbsp;
    <button class="btn btn-info btn-lg">发布商品</button>&nbsp;
    <button class="btn btn-danger btn-lg">页面管理</button>&nbsp;
    <button class="btn btn-warning btn-lg">客服系统</button>&nbsp;
{% endblock %}