<div class="dashboard_sidebar_second">
    <ul class="nav nav-pills nav-stacked">
        <li><span>设置</span></li>
        <li class="divider"></li>
        <li{% if board_nav_lv2 == 'info' %} class="active"{% endif %}><a href="{% url 'ent_board_settings_info' params.eid %}">商家信息</a></li>
        <li{% if board_nav_lv2 == 'store' %} class="active"{% endif %}><a href="{% url 'ent_board_settings_store_list' params.eid %}">门店管理</a></li>
        <li><a href="#">账号管理</a></li>
        <li><a href="#">角色管理</a></li>
        <li><a href="#">支付管理</a></li>

    </ul>
</div>