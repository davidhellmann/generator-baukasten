
{#
  Description of what this file is for

  @package  craft3
  @author David Hellmann [david@hellmann.io]

  m-card
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'm-card',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  foo: null,
  item: null,
  image: null,
  content: null,
  link: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.item %}
  <article class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'm-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
    {{ opt.waypoint ? ' data-waypoint' : '' }}
    {% for key, value in opt.data %}
      {{ 'data-' ~ key ~ '=' ~ value }}
    {% endfor %}>
    <a class="{{ opt.cn ~ '__link' }}" href="{{ opt.item.url }}">
      {% if opt.image %}
        {% include '_atoms/image/_template.html' with {
          opt: {
            image: opt.item.singleImageEntry.one(),
            ratio: 'landscape'
          }
        } only %}
      {% endif %}

      {% if opt.content %}
        {% include '_atoms/headline/_template.html' with {
          opt: {
            modifiers: [
              'h6'
            ],
            text: opt.item.title,
            size: 'h2'
          }
        } only %}

        {# -- Entry Intro -- #}
        {% if opt.item.singleIntroText ?? null %}
          <p>
            {% include '_atoms/richText/_template.html' with {
              opt: {
                text: opt.item.singleIntroText | striptags | truncateOnWord(140)
              }
            } only %}
          </p>
        {% endif %}
      {% endif %}

      {% if opt.link %}
        <span class="{{ opt.cn ~ '__readmore' }}">Read more</span>
      {% endif %}
    </a>
  </article>
{% endif %}
