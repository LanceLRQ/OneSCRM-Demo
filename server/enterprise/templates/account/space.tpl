{% extends "../base.tpl" %}
{% block base_title %}{% block db_title %}{% endblock %}{% endblock %}
{% block base_head %}
    <link rel="stylesheet" href="/static/css/dashboard.css">
    {% block db_head %}{% endblock %}
{% endblock %}
{% block base_body %}
    <!--第一级侧栏代码-->
    <div class="dashboard_sidebar_master">
        <ul class="nav nav-pills-inverse nav-stacked">
            <li><a href="#"><span class="glyphicon glyphicon-menu-hamburger"></span></a></li>
            <li{% if board_nav_lv1 == 'enterprise_list' %} class="active"{% endif %}><a href="#"><img src="https://open.weixin.qq.com/zh_CN/htmledition/res/assets/res-design-download/icon16_wx_logo.png" alt="">&nbsp;&nbsp;公众号管理</a></li>
            <li{% if board_nav_lv1 == 'value_service' %} class="active"{% endif %}><a href="#"><span class="glyphicon glyphicon-euro"></span>&nbsp;&nbsp;增值服务</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-minus"></span></a></li>
            <li{% if board_nav_lv1 == 'account_info' %} class="active"{% endif %}><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;账号信息</a></li>
            <li{% if board_nav_lv1 == 'hongbao' %} class="active"{% endif %}><a href="#"><span class="glyphicon glyphicon-yen"></span>&nbsp;&nbsp;红包账户</a></li>
            <li{% if board_nav_lv1 == 'caiwu' %} class="active"{% endif %}><a href="#"><span class="glyphicon glyphicon-pushpin"></span>&nbsp;&nbsp;财务管理</a></li>
        </ul>
    </div>
    <!--内容呈现区-->
    <div class="dashboard_panel dashboard_panel_hide_nav_lv2">
        {% block db_body %}{% endblock %}
    </div>
    <div id="dashboard_loading_layout" class="dashboard_loading_layout dashboard_loading_layout_nav_lv2">
        <div class="dashboard_loading_area"><img id="dashboard_loading_image" src="/static/images/loader.gif" height="60"><span id="dashboard_loading_text"><br />数据加载中...</span></div>
    </div>
{% endblock %}
{% block base_script %}{% block db_script %}{% endblock %}{% endblock %}