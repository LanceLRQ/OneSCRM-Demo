<div class="list-group">
    <a href="{% url "emgr_profile" %}" class="list-group-item{% if left_nav == 'profile' %} active{% endif %}">概况</a>
    <a href="{% url "emgr_vip_member" %}" class="list-group-item{% if left_nav == 'vip_member' %} active{% endif %}">会员</a>
    <a href="#" class="list-group-item">营销</a>
    <a href="#" class="list-group-item">应用</a>
    <a href="#" class="list-group-item">微信</a>
    <a href="#" class="list-group-item">数据</a>
    <a href="{% url "emgr_settings" %}" class="list-group-item{% if left_nav == 'settings' %} active{% endif %}">设置</a>
</div>