
{#
  Description of what this file is for

  @package  baukasten
  @author David Hellmann [davidhellmann.com@gmail.com]

  o-richTextMarginals
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-richTextMarginals',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  marginals: null,
  text: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.text %}
  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'o-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>

    {# -- Marginal First -- #}
    {% if opt.marginals.total >= 1 %}
      {% set marginalFirst = opt.marginals.first() ?? null %}
      {% if marginalFirst.children ?? null %}
        {% for marginalContent in marginalFirst.children %}
          <aside class="{{ opt.cn ~ '__aside' }}  {{ opt.cn ~ '__aside--first' }}">
            {% include '_contentBuilders/_contentBuilderModules.html' with { data: marginalContent } only %}
          </aside>
        {% endfor %}
      {% endif %}
    {% endif %}

    {# -- Text -- #}
    <div class="{{ opt.cn ~ '__text' }}">
      {{ opt.text | raw }}
    </div>

    {# -- Marginal Last -- #}
    {% if opt.marginals.total > 1 %}
      {% set marginalLast = opt.marginals.last() ?? null %}
      {% if marginalLast.children ?? null %}
        {% for marginalContent in marginalLast.children %}
          <aside class="{{ opt.cn ~ '__aside' }}  {{ opt.cn ~ '__aside--last' }}">
            {% include '_contentBuilders/_contentBuilderModules.html' with { data: marginalContent } only %}
          </aside>
        {% endfor %}
      {% endif %}
    {% endif %}
  </div>
{% endif %}
