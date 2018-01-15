
{#
  a-embed
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-embed',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  code: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.code %}
  {% if 'youtube.com' in opt.code or 'vimeo.com' in opt.code %}
    {% set video = true %}
  {% else %}
    {% set video = false %}
  {% endif %}

  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    <div class="{{ video ? 'o-ratio  o-ratio--16-9  ' : '' }}{{ opt.cn ~ '__holder' }}">
      {{ opt.code|raw }}
    </div>
  </div>
{% endif %}
