---
layout: development_wiki
title: Design choices
permalink: /dev/design_choices
root: true
lang: "en"
---

Here you can access documentation about several design choices made when designing RetroMeet and understand a bit better how to interact with each of them.

{% for doc in site.dev_docs %}
  {% if doc.url contains "/dev/design_choices/" %}
<a href="{{doc.url}}">{{doc.title}}</a>
  {% endif %}
{% endfor %}
