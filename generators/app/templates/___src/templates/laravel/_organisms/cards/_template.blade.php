
{#
  Description of what this file is for

  @package  craft3
  @author David Hellmann [david@hellmann.io]

  o-cards
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
    cn: 'o-cards',
    modifiers: [],
    data: {},
    js: null,
    waypoint: null,
    waypointAni: null,
    items: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.items %}
  <div class="o-row  {{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'o-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    {% for item in opt.items %}
      <div class="{{ opt.cn ~ '__item' }}">
        {% include '_molecules/card/_template.html' with {
          opt: {
            item: item,
            image: true,
            content: true,
            link: true
          }
        } only %}
      </div>
    {% endfor %}

    {% if opt.pagination %}
      <div class="{{ opt.cn ~ '__pagination' }}">
        {% if opt.paginationSimple %}
          {# -- Pagination Simple -- #}
          {% import '_partials/macros/_macro-paginationSimple.html' as macroPaginationSimple %}
          {{ macroPaginationSimple.paginationSimple(opt.pageInfo, craft, {}) }}
        {% else %}
          {# -- Pagination -- #}
          {% import '_partials/macros/_macro-pagination.html' as macroPagination %}
          {{ macroPagination.pagination(opt.pageInfo, craft, {}) }}
        {% endif %}
      </div>
    {% endif %}
  </div>
{% endif %}
