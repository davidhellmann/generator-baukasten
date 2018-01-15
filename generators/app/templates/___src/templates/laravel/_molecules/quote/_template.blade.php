
{#
  Description of what this file is for

  @package  craft3
  @author David Hellmann [david@hellmann.io]

  m-quote
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'm-quote',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  quote: null,
  source: null,
  sourceUrl: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.quote %}
  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'm-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>
    <blockquote class="{{ opt.cn ~ '__blockquote' }}">
      <p>
        {{ opt.quote }}
      </p>
      {% if opt.source %}
        <footer>
          <cite>
            {% if opt.sourceUrl %}
            <a href="{{ opt.sourceUrl }}" target="_blank">
              {% endif %}
              {{ opt.source }}
              {% if opt.sourceUrl %}
            </a>
            {% endif %}
          </cite>
        </footer>
      {% endif %}
    </blockquote>
  </div>
{% endif %}
