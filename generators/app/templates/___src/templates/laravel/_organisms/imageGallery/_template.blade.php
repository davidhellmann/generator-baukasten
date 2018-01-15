
{#
  Description of what this file is for

  @package  baukasten
  @author David Hellmann [davidhellmann.com@gmail.com]

  o-imageGallery
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-imageGallery',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  images: null,
  ratio: null,
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
              {% endfor %} itemscope itemtype="http://schema.org/ImageGallery">
    {% for image in opt.images.all() %}

      <figure class="{{ opt.cn ~ '__figure' }}">
        <a class="{{ opt.cn ~ '__link' }}"
           href="{{ image.url }}"
           itemprop="contentUrl"
           data-size="{{ image.width }}x{{ image.height }}">

          {% include '_atoms/image/_template.html' with {
            opt: {
              image: image,
              ratio: opt.ratio
            }
          } only %}
        </a>
      </figure>
    {% endfor %}
  </div>
{% endif %}
