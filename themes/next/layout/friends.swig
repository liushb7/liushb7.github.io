{% extends '_layout.swig' %}

{% block title %}
  {{ page.title }} | {{ config.title }}
{% endblock %}

{% block content %}
  <div class="post-block">
    <style>
      /* 友链页面样式 */
      .friends-container {
        margin: 2rem 0;
      }
      .friends-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 1.5rem;
        margin-top: 1.5rem;
      }
      .friend-card {
        background: #fff;
        border-radius: 8px;
        padding: 1.5rem;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-left: 4px solid #3498db;
      }
      .friend-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
      }
      .friend-header {
        display: flex;
        align-items: flex-start;
        gap: 1rem;
      }
      .friend-avatar {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        object-fit: cover;
        flex-shrink: 0;
      }
      .friend-info h3 {
        margin: 0 0 0.5rem 0;
      }
      .friend-info h3 a {
        color: #222;
        text-decoration: none;
      }
      .friend-info h3 a:hover {
        color: #3498db;
      }
      .friend-description {
        margin: 0;
        color: #666;
        font-size: 0.9rem;
        line-height: 1.4;
      }
    </style>

    <div class="post-content">
      <!-- 显示页面内容 -->
      {{ page.content }}
      
      <!-- 显示友链列表 -->
      <div class="friends-container">
        
        <div class="friends-grid">
          {% if site.data.friends %}
            {% for friend in site.data.friends %}
              <div class="friend-card" style="border-left-color: {{ friend.color }};">
                <div class="friend-header">
                  {% if friend.avatar %}
                    <img src="{{ friend.avatar }}" alt="{{ friend.name }}" class="friend-avatar">
                  {% endif %}
                  <div class="friend-info">
                    <h3>
                      <a href="{{ friend.url }}" target="_blank" rel="noopener">
                        {{ friend.name }}
                      </a>
                    </h3>
                    <p class="friend-description">{{ friend.description }}</p>
                  </div>
                </div>
              </div>
            {% endfor %}
          {% else %}
            <p>暂无友链信息，请先配置友链数据。</p>
          {% endif %}
        </div>
      </div>
    </div>
  </div>
{% endblock %}