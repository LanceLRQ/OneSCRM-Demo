<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的奖品</title>
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
            <h1 class='title'>我的奖品</h1>
        </header>
        <div class="content infinite-scroll infinite-scroll-bottom">
            <div class="buttons-tab">
                <a href="#tab1" class="tab-link active button">可使用(1)</a>
                <a href="#tab2" class="tab-link button">已失效(1)</a>
            </div>
            <div class="tabs">
                <div id="tab1" class="tab active">
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
                <div id="tab2" class="tab">
                    <div style="margin: 0 auto">
                        我竟然还没有奖品!
                    </div>
                    <div>
                        <p><a href="../welfare/welfare" class="button button-fill button-success external">马上去参加活动</a></p>
                    </div>
                    <div style="position: absolute;bottom: 0;width: 100%;text-align: center">
                        <div>OneSCRM</div>
                    </div>
                </div>

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
        var maxItems = 100;

        // 每次加载添加多少条目
        var itemsPerLoad = 10;

        function addItems(number, lastIndex) {
            // 生成新条目的HTML
            var html = '';
            for (var i = lastIndex + 1; i <= lastIndex + number; i++) {
                html += '<div class="card row" style="margin-left: 0; margin-right: 0"> <div class="col-80"> <div style="font-size: smaller;">二等奖 </div> <div style="font-size: x-large; margin: 0 auto">长隆套票一张</div> <div style="font-size: smaller">兑奖期限:<span>2016-7-10</span>-<span>2016-10-10</span> </div> </div> <div class="col-20"> <a href="../prize/write_off" style="font-size: x-small">兑奖</a> </div> </div>';
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