
{#
  a-plainText
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-plainText',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  text: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.text %}
  <p class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
            {{ opt.waypointAni ? opt.waypointAni : '' }}"
            {{ opt.waypoint ? ' data-waypoint' : '' }}
            {% for key, value in opt.data %}
              {{ 'data-' ~ key ~ '=' ~ value }}
            {% endfor %}>
    {{ opt.text | nl2br | raw }}
  </p>
{% endif %}
