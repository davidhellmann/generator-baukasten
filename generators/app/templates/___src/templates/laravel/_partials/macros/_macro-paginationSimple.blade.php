
{#
  Pagination
  ==========
  Powered by Kittn Generator: http://kittn.de/
  Generate navigation buttons for paginations
  It use the Pagination Module, include before the Loop `{% paginate entries as pageInfo, pageEntries %}`

  @param {object}  pages                 - Pagination Object
  @param {object}  craft                 - Craft Request Object
  @param {object}  options               - Array of options
  @param {string}  opt.cnname         - Classname (default: 'o-pagination')
  @param {string}  opt.searchquery   - To pass search words from Searchfields (default: false)
  @param {string}  opt.prevText      - Titletext for Prev
  @param {string}  opt.nextText      - Titletext for Next
#}
{% macro paginationSimple(pages,craft,opt) %}
  {% set defaults = {
    cn: 'm-paginationSimple',
    searchquery: false,
    prevText: 'Prev Page',
    nextText: 'Next Page',
    prevIcon: 'iconArrowLeft',
    nextIcon: 'iconArrowRight'
  } %}

  {# -- Merge Default with Options -- #}
  {% set opt = opt is defined ? defaults|merge(opt) : defaults %}

  {# Add Pagination only if the Page Number is higher than 1#}
  {% if pages.totalPages > 1 %}
    <nav class="o-row  {{ opt.cn }}" role="navigation">
        {# Display the Previous Link if available #}
        {% if pages.prevUrl %}
          <div class="{{ opt.cn ~ '__item' }}  {{ opt.cn ~ '__item--prev' }}">
            <a class="{{ opt.cn ~ '__link' }}  {{ opt.cn ~ '__link--prev' }}"
               href="{{ pages.prevUrl }}{{ opt.searchquery ? '?q='~opt.searchquery }}"
               title="{{ opt.prevText }}">

              {% if opt.prevIcon %}
                <span class="{{ opt.cn ~ '__icon' }}  {{ opt.cn ~ '__icon--prev' }}">
                {% include '_partials/svg/' ~ opt.prevIcon ~ '.svg.html' %}
              </span>
              {% endif %}

              <span class="{{ opt.cn ~ '__title' }}">
                {{ opt.prevText }}
              </span>
            </a>
          </div>
        {% endif %}

        {# Display next Page Link if available#}
        {% if pages.nextUrl %}
        <div class="{{ opt.cn ~ '__item' }}  {{ opt.cn ~ '__item--next' }}">
          <a class="{{ opt.cn ~ '__link' }}  {{ opt.cn ~ '__link--next' }}"
             href="{{ pages.nextUrl }}{{ opt.searchquery ? '?q='~opt.searchquery }}"
             title="{{ opt.nextText }}">

            {% if opt.nextIcon %}
              <span class="{{ opt.cn ~ '__icon' }}  {{ opt.cn ~ '__icon--next' }}">
                {% include '_partials/svg/' ~ opt.nextIcon ~ '.svg.html' %}
              </span>
            {% endif %}

            <span class="{{ opt.cn ~ '__title' }}">
              {{ opt.nextText }}
            </span>
          </a>
        </div>
        {% endif %}
    </nav>
  {% endif %}
{% endmacro %}
