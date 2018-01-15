
{#
  o-appFooter
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-appFooter',
  modifiers: [],
  data: {},
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
<footer class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.cn|replace({ 'o-' : 'js-' }) }}">
  {% cache %}
    {% block appFooter %}
      Baukasten &copy;2014 &mdash; {{ "now"|date("Y") }}


      {# -- Pagination Simple -- #}
      {% import '_partials/macros/_macro-socialNetworks.html' as macroSocialNetworks %}
      {{ macroSocialNetworks.socialNetworks({
        networks: 'all',
        label: true,
      }) }}
    {% endblock %}
  {% endcache %}
</footer>
