
{#
  o-imageSlider
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-imageSlider',
  modifiers: [],
  data: {},
  js: true,
  waypoint: null,
  waypointAni: null,
  images: null,
  caption: null,
  ratio: null,
  pagination: null,
  buttons: null,
  scrollbar: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.images %}
  <div class="{{ opt.cn }}">
    <div class="{{ opt.cn ~ '__slider' }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'o-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
      {{ opt.waypoint ? ' data-waypoint' : '' }}
      {% for key, value in opt.data %}
        {{ 'data-' ~ key ~ '=' ~ value }}
      {% endfor %} itemscope itemtype="http://schema.org/ImageGallery" role="presentation">
      <!-- Slides -->
      {% for image in opt.images.all() %}
        <div class="{{ opt.cn ~ '__slide' }}" itemscope itemtype="http://schema.org/ImageObject">
          <div class="{{ opt.cn ~ '__slideInner' }}">
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
        </div>
      {% endfor %}
    </div>
  </div>
{% endif %}
