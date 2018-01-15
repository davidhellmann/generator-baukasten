
{#
  Prev / Next Link
  ------------------------------------------------------------

  {{ macroPostNav.postNav(entry, 'work', 'postDate', 'prev work', 'next work' ) }}
#}

{% macro postNav(entry, opt) %}

  {# -- Defaults -- #}
  {% set defaults = {
    cn: 'm-postNav',
    section: null,
    order: 'postDate',
    prevLabel: false,
    nextLabel: false,
    prevIcon: false,
    nextIcon: false
  } %}

  {# -- Merge Default with Options -- #}
  {% set opt = opt is defined ? defaults|merge(opt) : defaults %}

  {% if opt.section %}
    {# Set parameters for prev/next elements list #}
    {% set entries = craft.entries.section(opt.section).orderBy(opt.order).limit(null) %}

    {# Get the prev/next elements #}
    {% set prevEntry = entry.getPrev(entries) %}
    {% set nextEntry = entry.getNext(entries) %}
  {% else %}
    {% set prevEntry = false %}
    {% set nextEntry = false %}
  {% endif %}

  {# And make sure to only output the links if the element exists #}
  {% if prevEntry or nextEntry %}
    <nav class="o-row  {{ opt.cn }}">
      {% if prevEntry %}
        <div class="{{ opt.cn ~ '__item' }}  {{ opt.cn ~ '__item--prev' }}">
          <a class="{{ opt.cn ~ '__link' }}  {{ opt.cn ~ '__link--prev' }}" href="{{ prevEntry.url }}">
            {% if opt.prevIcon %}
              <span class="{{ opt.cn ~ '__icon' }}  {{ opt.cn ~ '__icon--prev' }}">
                {% include '_partials/svg/' ~ opt.prevIcon ~ '.svg.html' %}
              </span>
            {% endif %}

            {% if opt.prevLabel %}
              <span class="{{ opt.cn ~ '__label' }}">{{ opt.prevLabel }}</span>
            {% endif %}

            <span class="{{ opt.cn ~ '__title' }}">{{ prevEntry.title }}</span>
          </a>
        </div>
      {% endif %}
      {% if nextEntry %}
        <div class="{{ opt.cn ~ '__item' }}  {{ opt.cn ~ '__item--next' }}">
          <a class="{{ opt.cn ~ '__link' }}  {{ opt.cn ~ '__link--next' }}" href="{{ nextEntry.url }}">
            {% if opt.nextLabel %}
              <span class="{{ opt.cn ~ '__label' }}">{{ opt.nextLabel }}</span>
            {% endif %}

            <span class="{{ opt.cn ~ '__title' }}">{{ nextEntry.title }}</span>

            {% if opt.nextIcon %}
              <span class="{{ opt.cn ~ '__icon' }}  {{ opt.cn ~ '__icon--next' }}">
                {% include '_partials/svg/' ~ opt.nextIcon ~ '.svg.html' %}
              </span>
            {% endif %}
          </a>
        </div>
      {% endif %}
    </nav>
  {% endif %}
{% endmacro %}
