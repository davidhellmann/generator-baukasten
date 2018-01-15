{#
  Description of what this file is for

  @package  <%= projectName %>
<% for (var i=0; i < authors.length; i++) { -%>
  @author <%= authors[i].name %> [<%= authors[i].email %>]
<% } -%>

  <%= pathOptions.key.charAt(0) %>-<%= moduleName.replace('-', '_') %>
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
    cn: '<%= pathOptions.key.charAt(0) %>-<%= moduleName.replace('-', '_') %>',
    modifiers: [],
    data: {},
    js: null,
    waypoint: null,
    waypointAni: null,
    foo: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.foo %}
  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ '<%= pathOptions.key.charAt(0) %>-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    <%= moduleName.replace('-', '_') %>
  </div>
{% endif %}
