
{# -- 404 Template -- #}
{# ---------------------------------------------------------------------- #}

{% extends '_layouts/_master.html' %}
{% set bodyClass = "p-404" %}
{% if seomaticSiteMeta ?? null %}
  {% set seomaticMeta = seomaticMeta | merge({'seoTitle': '404 — Page not Found' }) %}
{% else %}
  {% set appTitle = '404 — Page not Found' %}
{% endif %}

{# -- CRITICAL CSS -- #}
{% block appInlineCSS %}
  <style>
    {{ source (_self ~ '_critical.min.css', ignore_missing = true) }}
  </style>
{% endblock %}

{# -- Google Analytics Stuff -- #}
{% if googleAnalytics.globalGoogleAnalytics is defined and googleAnalytics.globalGoogleAnalytics %}
  {% set fourohfour %}
    ga('send', 'pageview', '/404/?url=' + document.location.pathname + document.location.search + '&ref=' + document.referrer);
  {% endset %}
{% endif %}

{# -- App Content -- #}
{% block appContent %}
  <div class="o-section">
    <div class="o-row">
      {# -- Include Page Title -- #}
      {% include '_molecules/pageTitle/_template.html' with {
        options: {
          text: '404 — Page not found',
          size: 'h1'
        }
      } only %}

      <p class="o-col">
        Oh no, this page is missing… Sorry!<br>
        Back to <a href="{{ siteUrl }}">Home</a>
      </p>
    </div>
  </div>
{% endblock %}
