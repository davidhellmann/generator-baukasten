
{#
  Language Switcher
  ------------------------------------------------------------

  {% import '_partials/macros/_macro-languageSwitcher.html' as macroLanguageSwitcher  %}

  {{ macroLanguageSwitcher.languageSwitcher({
    sites: ['noobs', 'pros']
  }, entry) }}
#}

{% macro languageSwitcher(opt, entry) %}
  {% set defaults = {
    cn: 'm-languageSwitcher',
    sites: null | default('all')
  } %}

  {# -- Merge Default with Options -- #}
  {% set opt = opt is defined ? defaults|merge(opt) : defaults %}
  {% if opt.sites is defined and entry is defined %}
    {# -- Get all Handles -- #}
    {% set allSiteHandles = [] %}
    {% for site in craft.app.sites.getAllSites() %}
      {% set allSiteHandles = allSiteHandles|merge([site.handle]) %}
    {% endfor %}

    {% set sites = opt.sites %}
    {% if sites == 'all' %}
      {% set sites = allSiteHandles %}
    {% endif %}

    <nav class="{{ opt.cn }}">
      <ul class="{{ opt.cn ~ '__list' }}">
        {% for site in sites %}
          {% if site in allSiteHandles %}

            <li class="{{ opt.cn ~ '__item' }}">
              {% set current = false %}

              {# Check if site equals the requested page site #}
              {% if site == craft.app.sites.currentSite.handle %}
                {% set current = true %}
              {% endif %}

              {% if entry is defined %}
                {% set siteEntry = craft.entries.id(entry.id).site(site).one() %}

                {% if siteEntry and (siteEntry.site.handle is defined and siteEntry.site.handle == site) %}
                  <a href="{{ siteEntry.getUrl() }}"
                     class="{{ opt.cn ~ '__link' }}{{ current ? ' ' ~ opt.cn ~ '__link--current' }}">
                    {{ site }}
                  </a>
                {% else %}
                  <a href="{{ craft.config.siteUrl[site] }}"
                     class="{{ opt.cn ~ '__link' }}{{ current ? ' ' ~ opt.cn ~ '__link--current' }}">
                    {{ site }}
                  </a>
                {% endif %}
              {% else %}
                <a href="{{ craft.config.siteUrl[site] ~ craft.app.request.pathInfo }}"
                   class="{{ opt.cn ~ '__link' }}{{ current ? ' ' ~ opt.cn ~ '__link--current' }}">
                  {{ site }}
                </a>
              {% endif %}
            </li>
          {% endif %}
        {% endfor %}
      </ul>
    </nav>
  {% endif %}
{% endmacro %}
