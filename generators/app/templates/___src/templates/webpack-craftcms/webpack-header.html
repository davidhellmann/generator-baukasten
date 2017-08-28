{# in dem htmlwebpack plugin gedöns, sind alle entry files drin, die loopen wir und fügen ein, die syntax ist wie bei yeoman EJS #}

{# -- CRITICAL CSS -- #}
{% set cacheVal = getCookie('critical-css') %}
{% if not cacheVal or craft.config.devMode %}
  {{ setCookie('critical-css', now | date_modify("+7 days").timestamp ) }}
  {% block appInlineCSS %}
  {% endblock %}

  <% if (htmlWebpackPlugin.files.css.length) { %>
  <% for (var css in htmlWebpackPlugin.files.css) { %>
  <link rel="preload" href="<%= htmlWebpackPlugin.files.css[css] %>" as="style" onload="this.rel='stylesheet'">
  <noscript><link rel="stylesheet" href="<%= htmlWebpackPlugin.files.css[css] %>"></noscript>
  <% } %>
  <% } %>

{% else %}
  <script>
    document.documentElement.className += " wf-loaded"
  </script>
  <% if (htmlWebpackPlugin.files.css.length) { %>
  <% for (var css in htmlWebpackPlugin.files.css) { %>
  <link rel="stylesheet" href="<%= htmlWebpackPlugin.files.css[css] %>">
  <% } %>
  <% } %>
{% endif %}
