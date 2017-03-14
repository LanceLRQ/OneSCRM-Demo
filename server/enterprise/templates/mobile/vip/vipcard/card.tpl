<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>会员卡</title>
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
            <h1 class='title'>会员卡</h1>
        </header>
        <div class="content">
            <form method="get" action="{% url "mobile_vip_vipcard_card" %}" id="get_card_info">
            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="/static/images/mobile/vipcard.png" alt="">
                </div>
            </div>
                <div class="list-block media-list">
                    <ul>
                        <li>
                            <div class="item-content">
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <a href="../level/level" class="item-title external">等级</a>
                                    </div>
                                    <div class="item-subtitle">{% vipInfo.vipLevel %}</div>
                                </div>
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <a href="../credit/credit" class="item-title external">积分</a>
                                    </div>
                                    <div class="item-subtitle">{% vipInfo.vipCredit %}</div>
                                </div>
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <a href="../vip/balance" class="item-title external">余额</a>
                                    </div>
                                    <div class="item-subtitle">{% vipInfo.vipBalance %}</div>
                                </div>
                                <div class="item-inner">
                                    <a href="../vip/pay" class="link external">自助<br>买单</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="card-footer">
                    <img src="/static/images/mobile/boardcast.png" width="30" height="30">
                    <a href="../vip/notice" class="item-content external">会员日活动大优惠,先到先得</a>
                </div>
                <div class="card-footer">
                    <img src="/static/images/mobile/scancode.png" width="30" height="30">
                    <a href="../vip/invite" class="item-content external">邀请好友扫码赚积分</a>
                </div>
        </form>

            <div class="list-block">
                <ul>
                    <li>
                        <a href="../cards_and_coupons/cards_and_coupons" class="item-link item-content external">
                            <div class="item-media">
                                <img src="/static/images/mobile/vipcard.png" width="44px" height="30px">
                            </div>
                            <div class="item-inner">
                                <div class="item-title">我的卡卷</div>
                                <div class="item-after">3</div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../prize/prize" class="item-link item-content external">
                            <div class="item-media">
                                <img src="/static/images/mobile/vipcard.png" width="44px" height="30px">
                            </div>
                            <div class="item-inner">
                                <div class="item-title">我的奖品</div>
                                <div class="item-after">3</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="list-block">
                <ul>
                    <li>
                        <a href="../welfare/welfare" class="item-link item-content external">
                            <div class="item-media">
                                <img src="/static/images/mobile/vipcard.png" width="44px" height="30px">
                            </div>
                            <div class="item-inner">
                                <div class="item-title">会员福利</div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../credit/exchange_items" class="item-link item-content external">
                            <div class="item-media">
                                <img src="/static/images/mobile/vipcard.png" width="44px" height="30px">
                            </div>
                            <div class="item-inner">
                                <div class="item-title">积分商城</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="list-block">
                <ul>
                    <li>
                        <a href="../cards_and_coupons/applicable_store" class="item-link item-content external">
                            <div class="item-media">
                                <img src="/static/images/mobile/vipcard.png" width="44px" height="30px">
                            </div>
                            <div class="item-inner">
                                <div class="item-title">适用门店</div>
                                <div class="item-after">3</div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="../vip/rights" class="item-link item-content external">
                            <div class="item-media">
                                <img src="/static/images/mobile/vipcard.png" width="44px" height="30px">
                            </div>
                            <div class="item-inner">
                                <div class="item-title">会员权益</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div style="width: 100%;text-align: center;bottom: 0">OneSCRM</div>
        </div>
    </div>
</div>
<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.js' charset='utf-8'></script>
</body>
</html>