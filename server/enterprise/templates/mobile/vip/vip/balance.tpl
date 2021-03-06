<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的余额</title>
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
            <h1 class='title'>我的余额</h1>
        </header>
        <div class="content infinite-scroll infinite-scroll-bottom">
            <div class="card">
                <div class="card-content" align="center"><br>
                    <div class="card-content-inner"><img src="/static/images/mobile/RMB.png" width="44px" height="44px">0.00</div>
                </div><br>
                <div class="card-footer row" align="center">
                    <div class="col-50">
                        <p><img src="/static/images/mobile/recharge.png" height="40px" width="40px"></p>
                        <a href="../vip/recharge">充值</a>
                    </div>
                    <div class="col-50" align="center">
                        <p><img src="/static/images/mobile/vip_upgrade.png" height="40px" width="50px"></p>
                        <a href="../vip/recharge_guide">充值攻略</a>
                    </div>
                </div>
            </div>


            <div class="content-block-title">6月累计充值1000元,消费100元</div>
            <div class="list-block">
                <ul class="list-container">
                </ul>
            </div>
            <!-- 加载提示符 -->
            <div class="infinite-scroll-preloader">
                <div class="preloader"></div>
            </div>

        </div>
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
                html += '<li class="item-content"><div class="item-inner"><div class="item-title"> <div class="row">  <div class="col-80" >自助买单</div> <div class="col-20" style="font-size: larger; color: red"><div>-150</div></div> <div class="col-80">2016/07/10 12:00:00</div> </div></div></div></li>';
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