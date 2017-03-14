<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的门店</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
</head>
<body>
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <header class="bar bar-nav">
            <h1 class='title'>我的门店</h1>
        </header>
        <div class="content">
            <div class="card">
                <div class="card-content">
                    <div class="card-content-inner">
                        <div class="row">
                            <div class="col-50">当前门店</div>
                            <div class="col-50" style="text-align: right">xxxxxxxx</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" style="font-size: small">您需要设置以下一家门店为默认门店,设置后可进行卡券及订单的核销,核销的卡券将结算到默认门店</div>
                <div class="card-content">
                    <div class="card-content-inner" style="color: orangered">
                        默认门店<span><input type="text" id='picker' placeholder="请手动选择门店 >" style="background-color: transparent; border: none" onclick="chooseShop()"/></span>
                        <button id="changepicker" onclick="pickerOpen()"></button>
                    </div>
                </div>
            </div>
            <p><a href="../account_binding/shop_helper" class="button button-fill button-success">确定</a></p>
        </div>
        <div style="position: absolute;bottom: 0;width: 100%;text-align: center">
            <div>OneSCRM</div>
        </div>
    </div>
</div>
</div>
<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
<script>
    $("#picker").picker({
        toolbarTemplate: '<header class="bar bar-nav">\
        <button class="button button-link pull-right close-picker">确定</button>\
        <h1 class="title">选择默认门店</h1>\
        </header>',
        cols: [
            {
                textAlign: 'center',
                values: ['A店', 'S店', 'D店', 'F店', 'G店', 'H店', 'J店', 'K店', 'L店'],
            }
        ]
    });
    function chooseShop() {
        $('#changepicker').text('更换默认门店');
    };
    function pickerOpen() {
        $('#picker').picker("open");
    }
</script>
</body>
</html>
