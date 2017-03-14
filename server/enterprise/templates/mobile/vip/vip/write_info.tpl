<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>填写会员资料</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
</head>
<body>
<header class="bar bar-nav">
    <h1 class='title'>激活会员卡</h1>
</header>
<div class="content">
    <div class="content-block-title" align="center">为了保证你的会员权益,请填写会员信息<br>只需要填写一次即可享受更多权益</div>
    <form id="writeInfo" action="{% url "mobile_vip_vip_write_info_save" params.appid params.openid %}" method="post">
        <div class="list-block">
            <ul>
                <!-- Text inputs -->
                {% if info.isPhone %}
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">电话</div>
                                <div class="item-input">
                                    <input type="tel" name="phone" placeholder="">
                                </div>
                            </div>
                        </div>
                    </li>
                {% endif %}
                {% if info.isNameNecessary %}
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="icon icon-form-name"></i></div>
                        <div class="item-inner">
                            <div class="item-title label">姓名</div>
                            <div class="item-input">
                                <input type="text" name="memberName" placeholder="">
                            </div>
                        </div>
                    </div>
                </li>
                {% endif %}
                {% if info.isSex %}
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-gender"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">性别</div>
                                <div class="item-input">
                                    <select name="sex">
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </li>
                {% endif %}
                <!-- Date -->
                {% if info.isBirthday %}
                <li>
                    <div class="item-content">
                        <div class="item-media"><i class="icon icon-form-calendar"></i></div>
                        <div class="item-inner">
                            <div class="item-title label">生日</div>
                            <div class="item-input">
                                <input type="date" name="birthday" placeholder="Birth day" value="">
                            </div>
                        </div>
                    </div>
                </li>
                {% endif %}
                {% if info.isMail %}
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">邮箱</div>
                                <div class="item-input">
                                    <input type="email" name="email" placeholder="">
                                </div>
                            </div>
                        </div>
                    </li>
                {% endif %}
                {% if info.isAddress %}
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">详细地址</div>
                                <div class="item-input">
                                    <input type="text" name="address" placeholder="">
                                </div>
                            </div>
                        </div>
                    </li>
                {% endif %}
                {% if info.isIdcard %}
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">身份证号码</div>
                                <div class="item-input">
                                    <input type="number" name="idcardnumber" placeholder="">
                                </div>
                            </div>
                        </div>
                    </li>
                {% endif %}
                {#<li>#}
                {#<div class="item-content">#}
                {#<div class="item-media"><i class="icon icon-form-password"></i></div>#}
                {#<div class="item-inner">#}
                {#<div class="item-title label">验证码</div>#}
                {#<div class="item-input col-50">#}
                {#<input type="text" name="vip_verification_code" placeholder="">#}
                {#</div>#}
                {#<a href="#" class="link">获取验证码</a>#}
                {#</div>#}
                {#</div>#}
                {#</li>#}
            </ul>
        </div>
        <div class="content-block">
            <div class="row">
                <div class="col-100"><a href="javascript:void(0)" class="button button-big button-fill button-success" onclick="btnClicked()">立即激活</a></div>
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
    {% if not showFlag %}
    $(function () {
        $('#writeInfo').submit();
    });
    {% endif %}
    function btnClicked() {
        $('#writeInfo').submit();
    }
</script>
</body>
</html>