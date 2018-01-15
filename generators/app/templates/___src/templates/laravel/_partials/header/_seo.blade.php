
{#
  Seomatic
  ------------------------------------------------------------
  Seomatic Plugin for Craft. Just awesome!
#}

{% if seomaticSiteMeta ?? null %}
  {% hook 'seomaticRender' %}
{% else %}
  <title>{% if appTitle is defined %}{{ appTitle }} &mdash; {% endif %}{{ siteName }}</title>
{% endif %}
