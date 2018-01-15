
{#
  Description of what this file is for

  @package  craft3
  @author David Hellmann [david@hellmann.io]

  m-definitionList
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'm-definitionList',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  items: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.items %}
  <dl class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'm-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    {% for item in opt.items %}
      <dt class="{{ opt.cn ~ '__term' }}">
        {{ item.term | raw }}
      </dt>
      <dd class="{{ opt.cn ~ '__description' }}">
        {{ item.description }}
      </dd>
    {% endfor %}
  </dl>
{% endif %}
