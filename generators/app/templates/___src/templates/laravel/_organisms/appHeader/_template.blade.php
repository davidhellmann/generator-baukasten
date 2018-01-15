
{#
  o-appHeader
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-appHeader',
  modifiers: [],
  data: {},
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
<header class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.cn|replace({ 'o-' : 'js-' }) }}">
  {% cache %}
    {% block appHeader %}
      {% include '_atoms/logo/_template.html' with {
          opt: {
              modifiers: [
                'header'
              ],
              url: siteUrl
          }
      } %}

    {% endblock %}
  {% endcache %}
</header>

