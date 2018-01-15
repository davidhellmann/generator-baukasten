
{#
  Description of what this file is for

  @package  craft3
  @author David Hellmann [david@hellmann.io]

  a-logo
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-logo',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  url: null,
  name: 'logo'
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.name %}
  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    {% if opt.url %}
      <a class="{{ opt.cn ~ '__link' }}" href="{{ opt.url }}">
    {% endif %}
      {% include '_partials/svg/' ~ opt.name ~ '.svg.html' %}
    {% if opt.url %}
      </a>
    {% endif %}
  </div>
{% endif %}

