
{#
  a-svgIcon
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-svgIcon',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  icon: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.icon %}
  <span class="{{ opt.cn }}  {{ opt.cn ~ '--' ~ opt.icon }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    {% include '_partials/svg/' ~ opt.icon ~ '.svg.html' %}
  </span>
{% endif %}
