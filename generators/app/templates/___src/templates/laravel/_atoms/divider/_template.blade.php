
{#
  a-divider
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-divider',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
<div class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
            {{ opt.waypointAni ? opt.waypointAni : '' }}"
            {{ opt.waypoint ? ' data-waypoint' : '' }}
            {% for key, value in opt.data %}
              {{ 'data-' ~ key ~ '=' ~ value }}
            {% endfor %}>
  <hr class="{{  opt.cn ~ '__hr'  }}" role="separator">
</div>
