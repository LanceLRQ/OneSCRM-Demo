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
            <li{% if board_nav_lv1 == 'index' %} class="active"{% endif %}><a href="{% url 'ent_board_profile' params.eid %}"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;首页</a></li>
            <li{% if board_nav_lv1 == 'vip_member' %} class="active"{% endif %}><a href="{% url 'ent_board_vip_member_vipcard'params.eid %}"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;会员</a></li>
            <li><a href=""><span class="glyphicon glyphicon-gift"></span>&nbsp;&nbsp;营销</a></li>
            <li><a href=""><span class="glyphicon glyphicon-th-large"></span>&nbsp;&nbsp;应用</a></li>
            <li><a href=""><img src="https://open.weixin.qq.com/zh_CN/htmledition/res/assets/res-design-download/icon16_wx_logo.png" alt="">&nbsp;&nbsp;微信</a></li>
            <li><a href=""><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;数据</a></li>
            <li{% if board_nav_lv1 == 'settings' %} class="active"{% endif %}><a href="{% url 'ent_board_settings_info' params.eid %}"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;设置</a></li>
        </ul>
    </div>
    <!--第二级侧栏代码-->
    {% block db_nav_lv2 %}{% endblock %}
    <!--内容呈现区-->
    <div class="dashboard_panel {% if board_hide_nav_lv2 %}dashboard_panel_hide_nav_lv2{% endif %}">
        {% block db_body %}{% endblock %}
    </div>
    <div id="dashboard_loading_layout" class="dashboard_loading_layout {% if board_hide_nav_lv2 %}dashboard_loading_layout_nav_lv2{% endif %}">
        <div class="dashboard_loading_area"><img id="dashboard_loading_image" src="/static/images/loader.gif" height="60"><span id="dashboard_loading_text"><br />数据加载中...</span></div>
    </div>
{% endblock %}
{% block base_script %}{% block db_script %}{% endblock %}{% endblock %}