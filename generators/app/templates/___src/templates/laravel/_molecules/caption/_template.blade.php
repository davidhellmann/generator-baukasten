
{#
  m-caption
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'm-caption',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  element: 'figcaption',
  headline: null,
  text: null,
  source: null,
  sourceUrl: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.headline ?? opt.text ?? null %}
  <{{ opt.element }} class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'm-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>

  {# -- Headline --#}
  {% if opt.headline ?? null %}
    <strong>{{- opt.headline ~ ' ' -}}</strong>
  {% endif %}

  {# -- Caption -- #}
  {{ opt.text ?? null }}{{ opt.source ? '&nbsp;&mdash;&nbsp;' }}

  {# -- Caption Source Url -- #}
  {% if (opt.source ?? null) and (opt.sourceUrl ?? null) %}
    {# -- link -- #}
    {% include '_atoms/link/_template.html' with {
      opt: {
        modifiers: ['inline'],
        url: opt.sourceUrl ?? null,
        targetBlank: true,
        text: opt.source ?? null,
        icon: null,
      }
    } only %}
  {% elseif opt.source ?? null %}
    {{ opt.source }}
  {% endif %}

  </{{ opt.element }}>
{% endif %}
