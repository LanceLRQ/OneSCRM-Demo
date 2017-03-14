<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>充值</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
    <script>
        var count100 = 0;
        var count150 = 0;
        var count200 = 0;
        var count250 = 0;
        var count300 = 0;
        var count350 = 0;
    </script>
</head>
<body>
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <header class="bar bar-nav">
            <h1 class='title'>充值</h1>
        </header>
        <div class="content">
            <nav class="bar bar-tab">
                <a href="#" class="button button-fill button-success" style="margin-left: 10px; margin-right: 10px; margin-top: 3px">下一步</a>
            </nav>
            <div class="card facebook-card">
                <div class="card-header row">
                    <div class="col-80"><br>
                        <div class="facebook-avatar"><img src="/static/images/mobile/recharge1.png" width="34" height="34"></div>
                        <div class="facebook-name">尹习念</div>
                        <div class="facebook-date">1234 5678 9876 5432</div>
                    </div>
                    <div class="col-20"><br>
                        <div class="facebook-avatar"><img src="/static/images/mobile/RMB.png" width="20" height="20">0.00</div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-content-inner row"><br>
                        <div style="border: dashed; width: 29%; height: 10%" class="col-33"  id="choose100" onclick=Onchoose100()>
                            <div align="center">
                                <p>100元</p>
                                <a>售价:98元</a>
                            </div>
                        </div>
                        <div style="border: dashed; width: 29%; height: 10%" class="col-33" id="choose150" onclick=Onchoose150()>
                            <div align="center">
                                <p>100元</p>
                                <a>售价:98元</a>
                            </div>
                        </div>
                        <div style="border: dashed; width: 29%; height: 10%" class="col-33" id="choose200" onclick=Onchoose200()>
                            <div align="center">
                                <p>100元</p>
                                <a>售价:98元</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-content-inner row">
                        <div style="border: dashed; width: 29%; height: 10%" class="col-33" id="choose250" onclick=Onchoose250()>
                            <div align="center">
                                <p>100元</p>
                                <a>售价:98元</a>
                            </div>
                        </div>
                        <div style="border: dashed; width: 29%; height: 10%" class="col-33" id="choose300" onclick=Onchoose300()>
                            <div align="center">
                                <p>100元</p>
                                <a>售价:98元</a>
                            </div>
                        </div>
                        <div style="border: dashed; width: 29%; height: 10%" class="col-33" id="choose350" onclick=Onchoose350()>
                            <div align="center">
                                <p>100元</p>
                                <a>售价:98元</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="list-block media-list">
                        <ul>
                            <li>
                                <div class="item-content" align="center">
                                    <div class="item-media"><img src="/static/images/mobile/wechat_pay.png" style='width: 1.5rem;'></div>
                                    <div class="item-inner">
                                        <div class="item-title-row">
                                            <div class="item-title">微信支付</div>
                                        </div>
                                        <div class="item-subtitle">推荐已安装微信客户端的用户使用</div>
                                    </div>
                                    <label class="col-20 label-checkbox item-content">
                                        <input type="radio" name="my-radio"/>
                                        <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="width: 100%;text-align: center;bottom: 0">
                <div>OneSCRM</div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
<script>
    $("#wechat_pay").click(function () {

    });

    function Onchoose100() {
        count100++;
        if(count100 % 2 == 0){
            $('#choose100').css('border-color','red');
        }else{
            $('#choose100').css('border-color','black');
        }
    }
    function Onchoose150() {
        count100++;
        if(count100 % 2 == 0){
            $('#choose150').css('border-color','red');
        }else{
            $('#choose150').css('border-color','black');
        }
    }
    function Onchoose200() {
        count100++;
        if(count100 % 2 == 0){
            $('#choose200').css('border-color','red');
        }else{
            $('#choose200').css('border-color','black');
        }
    }
    function Onchoose250() {
        count100++;
        if(count100 % 2 == 0){
            $('#choose250').css('border-color','red');
        }else{
            $('#choose250').css('border-color','black');
        }
    }
    function Onchoose300() {
        count100++;
        if(count100 % 2 == 0){
            $('#choose300').css('border-color','red');
        }else{
            $('#choose300').css('border-color','black');
        }
    }
    function Onchoose350() {
        count100++;
        if(count100 % 2 == 0){
            $('#choose350').css('border-color','red');
        }else{
            $('#choose350').css('border-color','black');
        }
    }
</script>
</body>
</html>