---
title: 5th Continent articles and posts
---

{% for post in site.posts %}
## <a href="{{ post.url }}">{{ post.title }}</a>
{{ post.excerpt }}
{% if post.image %}
{% include image.html url="/assets/img/pi.jpg" description="A tiny web server" %}
{% endif %}

{% endfor %}