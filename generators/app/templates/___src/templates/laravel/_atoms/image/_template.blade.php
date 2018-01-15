
{#
  a-image
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-image',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  image: null,
  ratio: null,
  dominantColor: true,
  objectFit: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.image %}
  {# -- Image Vars -- #}
  {% set imageSrc = opt.image.pluginOptimizedImagesAuto.srcset() %}
  {% set imageSrcset = opt.image.pluginOptimizedImagesAuto.srcset() %}
  {% set imageSrcsetWebP = opt.image.pluginOptimizedImagesAuto.srcsetWebP() %}
  {% set imagePlaceholderBox = opt.image.pluginOptimizedImagesAuto.placeholderBox() %}
  {% set imageMaxWidth = opt.image.pluginOptimizedImagesAuto.maxSrcsetWidth() %}
  {% set focalPoint = '50% 50%' %}

  {# -- Focal Point -- #}
  {% if opt.objectFit and opt.image.focalPoint  %}
    {% set focalpoint = opt.image.focalPoint | split(';') %}
    {% set focalPointX = focalpoint[0] * 100 %}
    {% set focalPointY = focalpoint[1] * 100 %}
    {% set focalPoint = focalPointX ~ '%' ~ ' ' ~ focalPointY ~ '%' | default('50% 50%') %}
  {% endif %}

  {# -- Ratio Switch -- #}
  {% if opt.ratio ?? null %}
    {% set ratio = opt.ratio %}
    {% if opt.ratio.value ?? null %}
      {% set ratio = opt.ratio.value %}
    {% endif %}

    {% switch ratio %}
    {% case "landscape" %}
      {% set imageSrc = opt.image.pluginOptimizedImagesLandscape.srcset() %}
      {% set imageSrcset = opt.image.pluginOptimizedImagesLandscape.srcset() %}
      {% set imageSrcsetWebP = opt.image.pluginOptimizedImagesLandscape.srcsetWebP() %}
      {% set imagePlaceholderBox = opt.image.pluginOptimizedImagesLandscape.placeholderBox() %}
      {% set imageMaxWidth = opt.image.pluginOptimizedImagesLandscape.maxSrcsetWidth() %}

    {% case "portrait" %}
      {% set imageSrc = opt.image.pluginOptimizedImagesPortrait.srcset() %}
      {% set imageSrcset = opt.image.pluginOptimizedImagesPortrait.srcset() %}
      {% set imageSrcsetWebP = opt.image.pluginOptimizedImagesPortrait.srcsetWebP() %}
      {% set imagePlaceholderBox = opt.image.pluginOptimizedImagesPortrait.placeholderBox() %}
      {% set imageMaxWidth = opt.image.pluginOptimizedImagesPortrait.maxSrcsetWidth() %}

    {% case "square" %}
      {% set imageSrc = opt.image.pluginOptimizedImagesSquare.srcset() %}
      {% set imageSrcset = opt.image.pluginOptimizedImagesSquare.srcset() %}
      {% set imageSrcsetWebP = opt.image.pluginOptimizedImagesSquare.srcsetWebP() %}
      {% set imagePlaceholderBox = opt.image.pluginOptimizedImagesSquare.placeholderBox() %}
      {% set imageMaxWidth = opt.image.pluginOptimizedImagesSquare.maxSrcsetWidth() %}

    {% default %}
      {% set imageSrc = opt.image.pluginOptimizedImagesAuto.srcset() %}
      {% set imageSrcset = opt.image.pluginOptimizedImagesAuto.srcset() %}
      {% set imageSrcsetWebP = opt.image.pluginOptimizedImagesAuto.srcsetWebP() %}
      {% set imagePlaceholderBox = opt.image.pluginOptimizedImagesAuto.placeholderBox() %}
      {% set imageMaxWidth = opt.image.pluginOptimizedImagesAuto.maxSrcsetWidth() %}
    {% endswitch %}
  {% endif %}

  {# -- Image -- #}
  <picture class="{{ opt.cn }}" {% if opt.dominantColor %}style="{{ 'background-color: ' ~ opt.image.pluginOptimizedImagesSquare.colorPalette[0] ?? 'black' }}"{% endif %}>
    <source srcset="{{ imageSrcsetWebP }}"
            sizes="100vw"
            type="image/webp" />
    <img class="{{ opt.cn ~ '__image' }}  lazyload"
         {% if opt.objectFit %}
           style="object-fit: {{ opt.objectFit }}; object-position: {{ focalPoint }}"
           data-object-fit="{{ opt.objectFit }}"
           data-object-position="{{ focalPoint }}"
         {% endif %}
         src="{{ imagePlaceholderBox }}"
         srcset="{{ imageSrcset }}"
         sizes="100vw"
         width="{{ imageMaxWidth }}"
         height="auto"
         alt="{{ opt.image.title }}"/>
    <noscript><img src="{{ opt.image.url }}"
                   alt="{{ opt.image.title }}"></noscript>
  </picture>
{% endif %}
