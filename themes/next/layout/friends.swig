{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}

{% block title %}
  {{ page.title }} | {{ config.title }}
{% endblock %}

{% block class %}page posts-expand{% endblock %}

{% block content %}

  {##################}
  {### PAGE BLOCK ###}
  {##################}
  <div class="post-block" lang="{{ page.lang or config.language }}">
    {#################}
    {### PAGE BODY ###}
    {#################}
    <div class="post-body{%- if page.direction and page.direction.toLowerCase() === 'rtl' %} rtl{%- endif %}">

      <style>
  /* 友链页面优化样式 - 紧凑版 */
  .friends-container {
    margin: 1.5rem 0;
  }
  .friends-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 1.2rem;
    margin-top: 1.2rem;
  }
  .friend-card {
    background: #fff;
    border-radius: 10px;
    padding: 1.2rem;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
    transition: all 0.3s ease;
    border-left: 3px solid #3498db;
    display: flex;
    align-items: flex-start;
    gap: 0.8rem;
    min-height: 90px;
  }
  .friend-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
  }
  /* 更小的圆形头像 */
  .friend-avatar-container {
    flex-shrink: 0;
    width: 55px;
    height: 55px;
  }
  .friend-avatar {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #f8f9fa;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
  }
  .friend-card:hover .friend-avatar {
    transform: scale(1.03);
    border-color: #3498db;
  }
  /* 默认头像占位符 */
  .avatar-placeholder {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
    font-weight: bold;
    border: 2px solid #f8f9fa;
  }
  .friend-info {
    flex: 1;
    min-width: 0;
  }
  .friend-info h3 {
    margin: 0 0 0.3rem 0;
    font-size: 1rem;
    line-height: 1.3;
  }
  .friend-info h3 a {
    color: #2c3e50;
    text-decoration: none;
    transition: color 0.3s ease;
  }
  .friend-info h3 a:hover {
    color: #3498db;
  }
  .friend-description {
    margin: 0;
    color: #666;
    font-size: 0.85rem;
    line-height: 1.4;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
  /* 响应式设计 */
  @media (max-width: 768px) {
    .friends-grid {
      grid-template-columns: 1fr;
      gap: 1rem;
    }
    .friend-card {
      padding: 1rem;
      min-height: 80px;
      gap: 0.7rem;
    }
    .friend-avatar-container {
      width: 50px;
      height: 50px;
    }
    .avatar-placeholder {
      font-size: 1.1rem;
    }
    .friend-info h3 {
      font-size: 0.95rem;
    }
    .friend-description {
      font-size: 0.8rem;
    }
  }
  /* 无友链提示样式 */
  .no-friends {
    text-align: center;
    padding: 2rem;
    color: #999;
    font-style: italic;
    font-size: 0.9rem;
  }
</style>

      <!-- 显示页面内容 -->
      {{ page.content }}
      
      <!-- 显示友链列表 -->
      <div class="friends-container">
        <div class="friends-grid">
          {% if site.data.friends %}
            {% for friend in site.data.friends %}
              <div class="friend-card" style="border-left-color: {{ friend.color | default('#3498db') }};">
                <div class="friend-avatar-container">
                  {% if friend.avatar %}
                    <img src="{{ friend.avatar }}" alt="{{ friend.name }}" class="friend-avatar" 
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                    <div class="avatar-placeholder" style="display: none;">
                      {{ friend.name | first | upper }}
                    </div>
                  {% else %}
                    <div class="avatar-placeholder">
                      {{ friend.name | first | upper }}
                    </div>
                  {% endif %}
                </div>
                <div class="friend-info">
                  <h3>
                    <a href="{{ friend.url }}" target="_blank" rel="noopener nofollow">
                      {{ friend.name }}
                    </a>
                  </h3>
                  <p class="friend-description">{{ friend.description | default('这位朋友还没有添加描述哦~') }}</p>
                </div>
              </div>
            {% endfor %}
          {% else %}
            <div class="no-friends">
              <p>暂无友链信息，请先配置友链数据。</p>
              <p>在 <code>source/_data/friends.json</code> 中添加友链信息</p>
            </div>
          {% endif %}
        </div>
      </div>

    </div>
    {#####################}
    {### END PAGE BODY ###}
    {#####################}
  </div>
  {######################}
  {### END PAGE BLOCK ###}
  {######################}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}