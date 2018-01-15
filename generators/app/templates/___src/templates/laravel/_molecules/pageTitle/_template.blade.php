
{#
  Description of what this file is for

  @package  baukasten
  @author David Hellmann [davidhellmann.com@gmail.com]

  m-pageTitle
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'm-pageTitle',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  object: entry ?? null,
  text: null,
  size: 'h1',
  link: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.object or opt.text %}
  {% if opt.text %}
    {% set headline = opt.text %}
  {% elseif opt.object.singleSeoTitle ?? null and opt.object.singleSeoTitle | length %}
    {% set headline = opt.object.singleSeoTitle %}
  {% else %}
    {% set headline = opt.object.title %}
  {% endif %}

  <{{ opt.size }} class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'm-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
  {% if opt.link %}
  <a class="{{ opt.cn ~ '__link' }}" href="{{ opt.link }}">
  {% endif %}
    {{ headline | nl2br }}
  {% if opt.link %}
  </a>
  {% endif %}
</{{ opt.size }}>
{% endif %}
