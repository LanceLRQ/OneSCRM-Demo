<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>买单</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
    <script>
        var count = 1;
    </script>
</head>
<body>
<div class="page-group">
    <!-- 单个page ,第一个.page默认被展示-->
    <div class="page">
        <header class="bar bar-nav">
            <h1 class='title'>买单</h1>
        </header>

        <div class="bar bar-footer">
            <a class="button button-fill button-success">确认买单</a>
        </div>

        <div class="content">
            <div class="content-block-title">
                付款给 <span><input type="text" id='picker' placeholder="请手动选择门店 >" style="background-color: transparent; border: none" onclick="chooseShop()"/></span>
                <button id="changepicker" onclick="pickerOpen()"></button>
            </div>
            <div class="card">
                <div class="card-header">
                    消费总金额:  ￥<input type="text" id="input" onchange="discount()" placeholder="请寻问服务员后输入"/>
                </div>
                <div class="card-content">
                    <div class="card-content-inner"  >
                        <div id="discount">高级会员享受9折优惠</div><br>
                        <div class="row">
                            <div class="col-80">可使用500积分抵扣<span id="deduction">￥5.00</span></div>
                            <div class="col-20"><input type="checkbox" name="deductionOnUse" id="deductionOnUse" onclick="deductionBtnClicked()"></div>
                        </div><br>
                        <div class="row">
                            <div class="col-80">可用优惠卷抵扣:<span><input type="text" id='discountpicker' placeholder="选择 >" style="background-color: transparent; border: none" onclick="chooseDiscount()"/></span></div>
                            <div class="col-20"><button id="changediscount" onclick="discountPickerOpen()"></button></div>
                        </div>
                    </div>
                </div>
            </div><br>

            <div class="card facebook-card">
                <div class="card-header no-border row">
                    <div class="col-80">
                        <div class="facebook-avatar"><img src="/static/images/mobile/zhifu_pay.png" width="34" height="34"></div>
                        <div class="facebook-name">余额支付</div>
                        <div class="facebook-date">可用余额支付￥400.00</div>
                    </div>
                    <label class="col-20 label-checkbox item-content">
                        <input type="radio" name="my-radio"/>
                        <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
                    </label>
                </div>
                <div class="card-header no-border row">
                    <div class="col-80">
                        <div class="facebook-avatar"><img src="/static/images/mobile/wechat_pay.png" width="34" height="34"></div>
                        <div class="facebook-name">微信支付</div>
                        <div class="facebook-date">推荐已安装微信客户端的用户使用</div>
                    </div>
                    <label class="col-20 label-checkbox item-content">
                        <input type="radio" name="my-radio"/>
                        <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
                    </label>
                </div>
            </div><br>

            <div class="card">
                <div class="card-content">
                    <div class="card-content-inner" align="center">实际支付: ￥<span style="color: red">0.00</span></div>
                </div>
            </div>

            <div style="position: absolute;width: 100%;text-align: center;bottom: 0">
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
        <h1 class="title">选择门店</h1>\
        </header>',
        cols: [
            {
                textAlign: 'center',
                values: ['A店', 'S店', 'D店', 'F店', 'G店', 'H店', 'J店', 'K店', 'L店'],
            }
        ]
    });

    $("#discountpicker").picker({
        toolbarTemplate: '<header class="bar bar-nav">\
        <button class="button button-link pull-right close-picker">确定</button>\
        <h1 class="title">选择优惠卷</h1>\
        </header>',
        cols: [
            {
                textAlign: 'center',
                values: ['5元优惠卷', '10元优惠卷', '15元优惠卷', '20元优惠卷'],
            }
        ]
    });

    function chooseShop() {
        $('#changepicker').text('切换');
    }

    function chooseDiscount() {
        $('#changediscount').text('更换');
    }

    function pickerOpen() {
        $('#picker').picker("open");
    }

    function discountPickerOpen() {
        $('#discountpicker').picker('open');
    }

    function discount() {
        var input = $('#input').val();
        var total = input * 0.9
        $('#discount').append("  减" + total);
    }


    function deductionBtnClicked(){
        count++;
        if(count%2 == 0){
            $('#deduction').css('color','red');
        }else {
            $('#deduction').css('color','black');
        }
    }


</script>
</body>
</html>