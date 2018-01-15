
{#
  Description of what this file is for

  @package  baukasten
  @author David Hellmann [davidhellmann.com@gmail.com]

  o-imageCover
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-imageCover',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  image: null,
  ratio: null,
  text: null,
  objectFit: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.image %}
  <div class="{{- opt.cn -}}
              {% for modifier in opt.modifiers %}
                {{- modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier -}}
              {% endfor %}  {{- opt.js ? '  ' ~ opt.cn|replace({ 'o-' : 'js-' }) : '' -}}
              {{- opt.waypointAni ? '  ' ~ opt.waypointAni : '' -}}"
              {{- opt.waypoint ? '  data-waypoint' : '' -}}
              {% for key, value in opt.data %}
                {{- '  data-' ~ key ~ '=' ~ value -}}
              {% endfor %}>
    {% include '_molecules/figure/_template.html' with {
      opt: {
        image: opt.image ?? null,
        ratio: opt.ratio ?? null,
        objectFit: 'cover'
      }
    } only %}

    {# -- Text -- #}
    {% if opt.text %}
      <div class="{{ opt.cn ~ '__text' }}">
        {{ opt.text }}
      </div>
    {% endif %}
  </div>
{% endif %}
