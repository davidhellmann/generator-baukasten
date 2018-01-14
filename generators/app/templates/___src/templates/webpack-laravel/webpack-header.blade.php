{# in dem htmlwebpack plugin gedöns, sind alle entry files drin, die loopen wir und fügen ein, die syntax ist wie bei yeoman EJS #}

<script>
  document.documentElement.className += " wf-loaded"
</script>
<% if (htmlWebpackPlugin.files.css.length) { %>
  <% for (var css in htmlWebpackPlugin.files.css) { %>
    <link rel="stylesheet" href="{{ URL::asset('<%= htmlWebpackPlugin.files.css[css] %>') }}">
  <% } %>
<% } %>
