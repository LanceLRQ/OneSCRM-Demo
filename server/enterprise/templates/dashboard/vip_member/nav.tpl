<div class="dashboard_sidebar_second">
    <ul class="nav nav-pills nav-stacked">
        <li><a href=""#>会员管理</a></li>
        <li class="divider"></li>
        <li{% if board_nav_lv2 == 'vipmanage' %} class="active"{% endif %}><a href="{% url 'ent_board_vip_member_vipmanage'params.eid %}">会员列表</a></li>
        <li{% if board_nav_lv2 == 'viplabel' %} class="active"{% endif %}><a href="{% url 'ent_board_vip_member_viplabel' params.eid %}">标签管理</a></li>
        <li class="divider"></li>
        <li{% if board_nav_lv2 == 'vipcard' %} class="active"{% endif %}><a href="{% url 'ent_board_vip_member_vipcard'params.eid %}">会员卡</a></li>
        <li{% if board_nav_lv2 == 'viplevel' %} class="active"{% endif %}><a href="{% url 'ent_board_vip_member_viplevel'params.eid %}">会员等级</a></li>
        <li><a href="#">会员特权</a></li>
        <li class="divider"></li>
        <li><a href="#">功能入口</a></li>
    </ul>
</div>