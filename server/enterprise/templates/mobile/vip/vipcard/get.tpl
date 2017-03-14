<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>领卡</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
</head>
</head>
<body>
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <header class="bar bar-nav">
            <h1 class='title'>会员卡</h1>
        </header>
        {% if marketPrice != null %}
        <div class="bar bar-footer">
            <div class="pull-left" style="line-height: 2.2rem;">领取会员卡可享受更多权益</div>
            <div class="pull-right"><a href="{% url 'mobile_vip_vip_write_info' params.appid params.openid %}" class="button button-fill button-success">领取会员卡</a></div>
        </div>
        {% else %}
            <div class="bar bar-footer">
                <div class="pull-left" style="line-height: 2.2rem;">领取会员卡可享受更多权益</div>
                <div class="pull-right"><a href="../vip/write_info" class="button button-fill button-success">领取会员卡</a></div>
            </div>
        {% endif %}

        <div class="content">
            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="/static/images/mobile/vipcard.png" alt="">
                </div>
            </div>

            <div class="card">
                <div class="card-header">会员权益</div>
                <div class="card-content">
                    <div class="list-block media-list">
                        <ul>
                            {% for vipBenefit in vipBenefits %}
                            <li class="item-content">
                                <div class="item-media">
                                    <img src="/static/images/mobile/vipprivilege.png" width="44" height="44">
                                </div>
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">{{ vipBenefit  }} </div>
                                    </div>
                                </div>
                            </li>
                            {% endfor %}
                        </ul>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">使用说明</div>
                <div class="card-content">
                    <div class="card-content-inner">
                        {% for readMe in readMes %}
                        <p>{{  readMe }}</p>
                        {% endfor %}
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="list-block">
                        <ul>
                            <li>
                                <a href="#" class="item-link item-content">
                                    <div class="item-media"><i class="icon icon-f7"></i></div>
                                    <div class="item-inner">
                                        <div class="item-title">3家适用门店</div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-content">
                    <div class="list-block media-list">
                        <ul>
                            <li class="item-content">
                                <div class="item-media">
                                    <img src="/static/images/mobile/cuppon.png" width="44" height="44">
                                </div>
                                <div class="item-inner">
                                    <div class="item-content">10元优惠卷</div>
                                </div>
                                <a href="#" style="margin-right: 10px" class="button button-warning">使用</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer" align="center"><p>OneSCRM</p></div>
        </div>
    </div>
</div>

<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
</body>
</html>