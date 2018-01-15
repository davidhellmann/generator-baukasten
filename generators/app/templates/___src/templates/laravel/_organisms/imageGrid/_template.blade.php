
{#
  o-imageGrid
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-imageGrid',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  images: null,
  caption: null,
  ratio: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.images %}
  <div class="o-row  {{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'o-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    {% for image in opt.images.all() %}
      <div class="{{ opt.cn ~ '__item' }}">
        {% include '_molecules/figure/_template.html' with {
          opt: {
            image: image,
            ratio: opt.ratio,
            caption: opt.caption,
            captionHeadline: image.imageTitle,
            captionText: image.imageCaption,
            captionSource: image.imageSourceText,
            captionSourceUrl: image.imageSourceUrl
          }
        } only %}
      </div>
    {% endfor %}
  </div>
{% endif %}
