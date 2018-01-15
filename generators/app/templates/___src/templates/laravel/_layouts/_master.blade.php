
{#
  Master Layout
  ------------------------------------------------------------

  This i the basic layout. Feel free to modify
#}

<!DOCTYPE html>
<html class="" lang="{{ craft.app.locale }}">
<head>

  {# -- CHECK JS -- #}
  {% include '_partials/global/_checkJS.html' %}

  {# -- CRITICAL CSS -- #}
  {% set cacheVal = getCookie('critical-css') %}
  {% if not cacheVal or craft.app.config.general.devMode %}
    {{ setCookie('critical-css', now | date_modify("+7 days").timestamp ) }}
    {% block appInlineCSS %}
    {% endblock %}
  {% endif %}

  {# -- CSS Part -- #}
  {% include '_partials/header/_css-part.html' %}

  {# -- META -- #}
  {% include '_partials/header/_meta.html' %}

  {# -- SCRIPTS -- #}
  {% include '_partials/header/_scripts.html' %}

  {# -- Custom Social Image -- #}
  {% if (
  (entry.singleImageEntry ?? null) or
  (seomaticSiteMeta.siteSeoImage is defined and seomaticSiteMeta.siteSeoImage | length )
  ) and (logo.globalLogo is defined and logo.globalLogo | length) %}

    {# -- Set Logo -- #}
    {% set logo = logo.globalLogo.first() %}

    {# -- Imager: Watermark Image -- #}
    {% set watermarkImage = craft.imager.transformImage(logo, [
        {
            width: 100,
            height: 100
        }], {
            jpegQuality: 100,
        })
    %}

    {# -- Watermark Image URL -- #}
    {% set watermarkImage = watermarkImage[0].url %}

    {# -- Check if Entry Image exists or use the default SEO Image -- #}
    {% if entry.singleImageEntry | length %}
      {% set image = entry.singleImageEntry.first() %}
    {% else %}
      {% set image = seomaticSiteMeta.siteSeoImage %}
    {% endif %}

    {# -- Check if Focal Point is set else use center center -- #}
    {% if image.settingsFocalPoint is defined %}
      {% set position = image.settingsFocalPoint %}
    {% else %}
      {% set position = '50% 50%' %}
    {% endif %}

    {# -- Imager: Entry / Default Image -- #}
    {% set imageEntry = craft.imager.transformImage(image, [
    {
        width: 1200,
        height: 630
    }], {
        jpegQuality: 100,
        mode: 'crop',
        position: position
    })
    %}

    {# -- Entry / Default Image URL -- #}
    {% set imageEntry = imageEntry[0].url %}

    {# -- Imager: Share Image -- #}
    {% set shareIamge = craft.imager.transformImage(imageEntry, [
    {
        width: 1200,
        height: 630
    }], {
        jpegQuality: 100,
        mode: 'crop',
        ratio: '',
        watermark: {
            image: watermarkImage,
            width: 100,
            height: 100,
            position: {
            left: 30,
            bottom: 30,
            opacity: 0.8
        }
    }
    })
    %}

    {# -- Share Image URL -- #}
    {% set shareIamge = shareIamge[0].url %}

    {# -- If Share Image exists -- #}
    {% if shareIamge | length %}

      {# -- Set Twitter Share Image -- #}
      {% if seomaticMeta.twitter is defined and seomaticMeta.twitter is not empty %}
        {% set twitter = seomaticMeta.twitter %}
        {% set twitter = twitter | merge({'image': siteUrl|trim('/', 'right') ~ shareIamge}) %}
        {% set seomaticMeta = seomaticMeta | merge({'twitter': twitter}) %}
      {% endif %}

      {# -- Set Default Share Image -- #}
      {% set seomaticMeta = seomaticMeta | merge({'seoImage': siteUrl|trim('/', 'right') ~ shareIamge}) %}

      {# -- Set Facebook Share Image -- #}
      {% if seomaticMeta.og is defined and seomaticMeta.og is not empty %}
        {% set og = seomaticMeta.og %}
        {% set og = og | merge({
        'image': siteUrl|trim('/', 'right') ~ shareIamge,
        'image:width': '1200',
        'image:height': '630',
        'image:type': 'image/jpeg'
        }) %}
        {% set seomaticMeta = seomaticMeta | merge({'og': og}) %}
      {% endif %}
    {% endif %}
  {% endif %}

  {# -- SEO & TITLE TAG -- #}
  {% include '_partials/header/_seo.html' %}

  {# -- FAV ICON -- #}
  {% include '_partials/header/_favicons.html' %}

  {% block siteHeader %}{% endblock %}
</head>
{% minify html %}
<body id="home"
      class="{{ bodyClass is defined ? bodyClass }}  {{ craft.app.request.isLivePreview ? 'is-livePreview' }}  {{ craft.app.config.general.devMode ? 't-devMode' }}">

{# -- Preloader#}
{% include '_atoms/preloader/_template.html' only %}

<div class="m-appWrapper">
  {# -- App Header -- #}
  {% include '_organisms/appHeader/_template.html' only %}

  <div class="m-appContent">
    {% block appContent %}
      Content
    {% endblock %}
  </div>

  {# -- App Footer -- #}
  {% include '_organisms/appFooter/_template.html' only %}
</div>

{# -- Grid Overlay -- #}
{% if craft.app.config.general.devMode %}
  <div class="js-toggleGrid">G</div>
  <div class="o-section  o-gridOverlay  ">
    <div class="o-row">
      {% for i in 1..24 %}
        <div class="o-col"></div>
      {% endfor %}
    </div>
  </div>
{% endif %}

{# -- SCRIPTS -- #}
{% include '_partials/footer/_scripts.html' only %}

</body>
{% endminify %}
<!-- Läuft, weitermachen! -->
</html>

