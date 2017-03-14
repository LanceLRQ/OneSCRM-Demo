<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>身份验证</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
</head>
<body>
<header class="bar bar-nav">
    <h1 class='title'>身份验证</h1>
</header>
<div class="content">
    <div class="content-block-title" align="center">请输入手机号及验证码，通过验证后即绑定成功</div>
    <form id="writeInfo" action="{% url "mobile_vip_write_info_save" %}" method="post">
        <div class="list-block">
            <ul>
                <!-- Text inputs -->
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="icon icon-form-email"></i></div>
                        <div class="item-inner">
                            <div class="item-title label">手机号</div>
                            <div class="item-input">
                                <input type="tel" name="phone" placeholder="">
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="icon icon-form-password"></i></div>
                        <div class="item-inner">
                            <div class="item-title label">验证码</div>
                            <div class="item-input col-50">
                                <input type="text" name="vip_verification_code" placeholder="">
                            </div><a href="#" class="link">获取验证码</a></div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="content-block">
            <div class="row">
                <div class="col-100"><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btnClicked()">确定</a></div>
            </div>
        </div>
    </form>
    <div style="position: absolute;bottom: 0;width: 100%;text-align: center">
        <div>OneSCRM</div>
    </div>
</div>

<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
<script>
    function btnClicked() {
        $('#writeInfo').submit();
    }
</script>
</body>
</html>