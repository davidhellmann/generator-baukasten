
{#
  a-link
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-link',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  url: null,
  targetBlank: null,
  text: null,
  icon: null,
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.text and opt.url %}
  <a href="{{ opt.url }}" {{ opt.url starts with '#' ? 'data-scroll' : '' }}
     class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
            {{ opt.waypointAni ? opt.waypointAni : '' }}"
            {{ opt.waypoint ? ' data-waypoint' : '' }}
            {{ opt.targetBlank ? 'target="_blank"'}}
     itemprop="url"
     role="button"
      {% for item in opt.data %}
        {{ 'data-' ~ item.data ~ '=' ~ item.attribute }}
      {% endfor %}>
    {% if opt.icon %}

      {# -- Link Text -- #}
      <span class="{{ opt.cn ~ '__text' }}">
      {{ opt.text }}
      </span>

      {# -- Icon -- #}
      {% include '_atoms/icon/_template.html' with {
        opt: {
          icon: opt.icon
        }
      } only %}
    {% else %}
      {{ opt.text }}
    {% endif %}
  </a>
{% endif %}




