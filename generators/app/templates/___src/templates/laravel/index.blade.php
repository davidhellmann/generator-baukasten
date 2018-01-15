
{# -- Home -- #}
{# ---------------------------------------------------------------------- #}

{% extends "_layouts/_master.html" %}
{% set bodyClass = "p-home" %}

{# -- CRITICAL CSS -- #}
{% block appInlineCSS %}
  <style>
    {{ source (_self ~ '_critical.min.css', ignore_missing = true) }}
  </style>
{% endblock %}

{# -- App Content -- #}
{% block appContent %}

  {# -- Cache -- #}
  {% cache globally using key 'home' ~ craft.app.request.pathInfo ~ (craft.app.request.pageNum ? '/p' ~ craft.app.request.pageNum : '') %}

  {% embed '_embeds/home/_template.html' with {
    opt: {
      intro: true,
      content: true
    },
    entry: entry
  } only %}

    {# -- Block: Intro -- #}
    {% block intro %}
      {# -- Include Page Title -- #}
      {% include '_molecules/pageTitle/_template.html' with {
        opt: {
          object: entry,
          size: 'h1'
        }
      } only %}
    {% endblock %}

    {# -- Block: Content -- #}
    {% block content %}
      {# -- Vue Stuff -- #}
      <div id="js-vue"></div>
    {% endblock %}
  {% endembed %}

  {# -- Cache End -- #}
  {% endcache %}
{% endblock %}
