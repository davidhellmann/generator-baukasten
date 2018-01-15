
{#
  a-input
  Codepen: https://codepen.io/davidhellmann/pen/OOLmYq
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-input',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  type: 'text',
  name: null,
  value: null,
  min: null,
  max: null,
  minlength: null,
  maxlength: null,
  readonly: null,
  pattern: null,
  required: null,
  disabled: null,
  step: null,
  placeholder: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.type and opt.name %}
  <input class="{{ opt.cn }}
                {% for modifier in opt.modifiers %}
                  {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
                {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
                {{ opt.waypointAni ? opt.waypointAni : '' }}"
         {% if opt.min %}type="{{ opt.type }}"{% endif %}
         {% if opt.min %}name="{{ opt.name }}"{% endif %}
         {% if opt.min %}value="{{ opt.value }}"{% endif %}
         {% if opt.min %}min="{{ opt.min }}"{% endif %}
         {% if opt.max %}max="{{ opt.max }}"{% endif %}
         {% if opt.minlength %}minlength="{{ opt.minlength }}"{% endif %}
         {% if opt.maxlength %}maxlength="{{ opt.maxlength }}"{% endif %}
         {% if opt.step %}step="{{ opt.step }}"{% endif %}
         {% if opt.pattern %}pattern="{{ opt.pattern }}"{% endif %}
                {{ opt.waypoint ? ' data-waypoint' : '' }}
                {% for key, value in opt.data %}
                  {{ 'data-' ~ key ~ '=' ~ value }}
                {% endfor %}
                {{ opt.required ? 'required' }}
                {{ opt.readonly ? 'readonly' }}
                {{ opt.disabled ? 'disabled' }}  placeholder="{{ opt.placeholder }}">
{% endif %}
