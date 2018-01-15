
{#
  a-svgSprite
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-svgSprite',
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
  <svg class="{{ opt.cn }}  {{ opt.cn ~ '--' ~ opt.icon }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
       viewbox="0 0 48 48"
      {% for key, value in opt.data %}
        {{ 'data-' ~ key ~ '=' ~ value }}
      {% endfor %}>
    <use xlink:href="/assets/images/svg/sprite/sprite.svg#{{ opt.icon }}"></use>
  </svg>
{% endif %}
