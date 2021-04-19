---
layout: page
title: Tags
permalink: /tags/
---

{% for tag in site.tags %}
### {{ tag[0] }}
{% for post in tag[1] %}
{% if post.open %}
- [{{ post.title }}]({% include relative %}{{ post.url }})
{% endif %}
{% endfor %}
{% endfor %}