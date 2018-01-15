
{#
  {% embed '_embeds/home/_template.html' with { entry: entry } o
    opt: {
      cn: 'e-home',
      modifiers: [],
      data: {},
      js: null,
      waypoint: null,
      waypointAni: null,
      intro: null,
      content: null
    },
    entry: entry
  } only %}
    {% block intro %}
      Block: Intro!
    {% endblock %}

    {% block content %}
      Block: Content!
    {% endblock %}
  {% endembed %}
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'e-home',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  intro: null,
  content: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.intro and opt.content %}
  <div class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.js ? opt.cn|replace({ 'e-' : 'js-' }) : '' }}
            {{ opt.waypointAni ? opt.waypointAni : '' }}"
    {{ opt.waypoint ? ' data-waypoint' : '' }}
    {% for key, value in opt.data %}
      {{ 'data-' ~ key ~ '=' ~ value }}
    {% endfor %}>

    {% if opt.intro %}
      <div class="o-section">
        <div class="o-row">
          <div class="{{ opt.cn ~ '__intro' }}">
            {% block intro %}
              Block: Intro!
            {% endblock %}
          </div>
        </div>
      </div>
    {% endif %}

    {% if opt.content %}
      <div class="o-section">
        <div class="o-row">
          <div class="{{ opt.cn ~ '__content' }}">
            {% block content %}
              Block: Content!
            {% endblock %}
          </div>
        </div>
      </div>
    {% endif %}
  </div>
{% endif %}
