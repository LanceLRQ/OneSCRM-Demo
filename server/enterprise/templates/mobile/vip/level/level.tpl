<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>会员等级</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
    <style type="text/css">
        .infinite-scroll-preloader {
            margin-top:-20px;
        }
    </style>
</head>
<body>
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <header class="bar bar-nav">
            <h1 class='title'>会员等级</h1>
        </header>
        <div class="content infinite-scroll infinite-scroll-bottom">
            <div class="card">
                <div class="card-content" align="center"><br>
                    <div class="card-content-inner"><img src="/static/images/mobile/RMB.png" width="44px" height="44px">普通会员</div>
                </div><br>
                <div class="card-footer row">
                    <div class="col-50">
                        <div><img src="/static/images/mobile/vip_upgrade.png" height="20px" width="20px"><a style="color: black">我的会员权益</a></div>
                    </div>
                    <div class="col-50" align="center">
                        <a href="../vip/rights" class="external">更多会员权益 ></a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-80" style="margin-left: 10%">
                        <img src="" width="30px" height="30px"><span>领取微信会员卡即成为普卡会员</span>
                    </div>
                </div>
                <hr color="#EDEDED" width="90%" size="1">
                <div class="row">
                    <div class="col-80" style="margin-left: 10%">
                        <img src="" width="30px" height="30px"><span>享受 99% 的会员折扣</span>
                    </div>
                </div>
                <hr color="#EDEDED" width="90%" size="1">
                <div class="row" style="margin-left: 0%">
                    <div class="col-80">10元代金券</div>
                    <div class="col-30">限3000份</div>
                </div>
                <div class="row" style="margin-left: 0%">
                    <div class="col-80">首次开通会员卡赠送</div>
                    <div class="col-30">剩余27天</div>
                </div>
                <hr color="#EDEDED" width="90%" size="1">
                <div class="row" style="margin-left: 0%">
                    <div class="col-80">188积分</div>
                    <div class="col-30"></div>
                </div>
                <div class="row" style="margin-left: 0%">
                    <div class="col-80">首次开通会员卡赠送</div>
                    <div class="col-30">剩余27天</div>
                </div>
                <hr color="#EDEDED" width="90%" size="1">
                <div class="row" style="margin-left: 0%">
                    <div class="col-80">100元红包</div>
                    <div class="col-30"></div>
                </div>
                <div class="row" style="margin-left: 0%">
                    <div class="col-80">单次充值满500赠送</div>
                    <div class="col-30">剩余27天</div>
                </div>
                <hr color="#EDEDED" width="90%" size="1">


                {#<div class="list-block">#}
                {#<ul class="list-container">#}
                {#</ul>#}
                {#</div>#}
                {#<!-- 加载提示符 -->#}
                {#<div class="infinite-scroll-preloader">#}
                {#<div class="preloader"></div>#}
                {#</div>#}
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="list-block media-list">
                        <ul>
                            <li class="item-content">
                                <div class="item-media">
                                    <img src="" width="44" height="44">
                                </div>
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">买单购物享受超值会员价</div>
                                    </div>
                                    <div class="item-subtitle">xxxxxxxxxxxxxxxxxxxxx</div>
                                </div>
                            </li>
                            <li class="item-content">
                                <div class="item-media">
                                    <img src="" width="44" height="44">
                                </div>
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">享受积分累积及兑换礼包</div>
                                    </div>
                                    <div class="item-subtitle">xxxxxxxxxxxxxxxxxxxxx</div>
                                </div>
                            </li>
                            <li class="item-content">
                                <div class="item-media">
                                    <img src="" width="44" height="44">
                                </div>
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">尊享开卡礼包</div>
                                    </div>
                                    <div class="item-subtitle">xxxxxxxxxxxxxxxxxxxxx</div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="width: 100%;text-align: center;bottom: 0">OneSCRM</div>
        </div>
    </div>
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
    <script>
        $(function () {

            $.init()
            // 加载flag
            var loading = false;
            // 最多可加载的条目
            var maxItems = 30;

            // 每次加载添加多少条目
            var itemsPerLoad = 10;

            function addItems(number, lastIndex) {
                // 生成新条目的HTML
                var html = '';
                for (var i = lastIndex + 1; i <= lastIndex + number; i++) {
                    html += '<li class="item-content"><div class="item-inner"><div class="item-title"> <div>累积积分10010分，升级为高级会员</div> <div style="font-size: smaller">2016/07/10 12:00:00</div> </div></div></li>';
                }
                // 添加新条目
                $('.infinite-scroll-bottom .list-container').append(html);

            }

            //预先加载10条
            addItems(itemsPerLoad, 0);

            // 上次加载的序号

            var lastIndex = 10;

            // 注册'infinite'事件处理函数
            $(document).on('infinite', '.infinite-scroll-bottom', function () {

                // 如果正在加载，则退出
                if (loading) return;

                // 设置flag
                loading = true;

                // 模拟1s的加载过程
                setTimeout(function () {
                    // 重置加载flag
                    loading = false;

                    if (lastIndex >= maxItems) {
                        // 加载完毕，则注销无限加载事件，以防不必要的加载
                        $.detachInfiniteScroll($('.infinite-scroll'));
                        // 删除加载提示符
                        $('.infinite-scroll-preloader').remove();
                        return;
                    }

                    // 添加新条目
                    addItems(itemsPerLoad, lastIndex);
                    // 更新最后加载的序号
                    lastIndex = $('.list-container li').length;
                    //容器发生改变,如果是js滚动，需要刷新滚动
                    $.refreshScroller();
                }, 1000);
            });
        });
    </script>
</body>
</html>