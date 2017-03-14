<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的卡券</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
    <style type="text/css">
        .infinite-scroll-preloader {
            margin-top: -20px;
        }
    </style>
</head>
<body>
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <header class="bar bar-nav">
            <h1 class='title'>我的卡券</h1>
        </header>
        <div class="content infinite-scroll infinite-scroll-bottom">
            <div class="content-block">
                <div class="card-block container">

                </div>
                <!-- 加载提示符 -->
                <div class="infinite-scroll-preloader">
                    <div class="preloader"></div>
                </div>
            </div>
            <div style="width: 100%;text-align: center;bottom: 0">OneSCRM</div>
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
        var maxItems = 20;

        // 每次加载添加多少条目
        var itemsPerLoad = 5;

        function addItems(number, lastIndex) {
            // 生成新条目的HTML
            var html = '';
            for (var i = lastIndex + 1; i <= lastIndex + number; i++) {
                html += '<a href="../cards_and_coupons/write_off"><div class="card"> <div class="card-content"> <div class="card-content-inner row"> <div class="col-80"> <img src="" width="20" height="20" style="border-radius:50%; overflow:hidden;"> <span>现金券</span> <p>10元优惠卷会员专享</p> </div> <div class="col-20"> <div>10</div> </div> </div> </div> <div class="card-footer row"> <div class="col-50">消费满100元可用 </div> <div class="col-50" style="color: red">2天过期 </div> </div> </div></a>';
            }
            // 添加新条目
            $('.infinite-scroll-bottom .container').append(html);

        }

        //预先加载20条
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
                lastIndex = $('.container li').length;
                //容器发生改变,如果是js滚动，需要刷新滚动
                $.refreshScroller();
            }, 1000);
        });
    });
</script>
</body>
</html>
