
{#
  Description of what this file is for

  @package  baukasten
  @author David Hellmann [davidhellmann.com@gmail.com]

  o-imageSingle
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-imageSingle',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  image: null,
  caption: null,
  ratio: null,
  captionHeadline: null,
  captionText: null,
  captionSource: null,
  captionSourceUrl: null
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
        caption: opt.caption ?? null,
        ratio: opt.ratio ?? null,
        captionHeadline: opt.captionHeadline ?? null,
        captionText: opt.captionText ?? null,
        captionSource: opt.captionSource ?? null,
        captionSourceUrl: opt.captionSourceUrl ?? null
      }
    } only %}
  </div>
{% endif %}
