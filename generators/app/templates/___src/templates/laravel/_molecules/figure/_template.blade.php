
{#
  m-figure
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'm-figure',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  image: null,
  ratio: null,
  dominantColor: true,
  caption: null,
  captionHeadline: null,
  captionText: null,
  captionSource: null,
  captionSourceUrl: null,
  objectFit: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.image %}
  <figure class="{{- opt.cn -}}
              {% for modifier in opt.modifiers %}
                {{- modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier -}}
              {% endfor %}  {{- opt.js ? '  ' ~ opt.cn|replace({ 'm-' : 'js-' }) : '' -}}
              {{- opt.waypointAni ? '  ' ~ opt.waypointAni : '' -}}"
              {{- opt.waypoint ? '  data-waypoint' : '' -}}
              {% for key, value in opt.data %}
                {{- '  data-' ~ key ~ '=' ~ value -}}
              {% endfor %}
          itemprop="associatedMedia"
          itemscope itemtype="http://schema.org/ImageObject">

    {# -- image -- #}
    {% include '_atoms/image/_template.html' with {
      opt: {
        image: opt.image,
        ratio: opt.ratio,
        dominantColor: opt.dominantColor,
        objectFit: opt.objectFit
      }
    } only %}

    {# -- caption -- #}
    {% if opt.caption %}
      {% include '_molecules/caption/_template.html' with {
        opt: {
          headline: opt.captionHeadline ?? null,
          text: opt.captionText ?? null,
          source: opt.captionSource ?? null,
          sourceUrl: opt.captionSourceUrl ?? null
        }
      } only %}
    {% endif %}
  </figure>
{% endif %}
