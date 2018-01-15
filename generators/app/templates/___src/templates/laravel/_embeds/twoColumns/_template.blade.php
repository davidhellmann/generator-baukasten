
{#
    {% embed '_templates/twoColumns/_template.html' with {
      options: {
        modiefiers: ['YOUR_MODIFIER'],
        area1: true,
        area2: true,
        area3: true
      }
    } only %}
    {% block area1 %}
      …
    {% endblock %}

    {% block area2 %}
      …
    {% endblock %}

    {% block area3 %}
      …
    {% endblock %}
  {% endembed %}
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'e-twoColumns',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
  intro: null,
  content: null,
  sidebar: null
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

    {# -- Block: Intro -- #}
    {% if opt.intro %}
      <div class="o-section">
        <div class="o-row  o-row-12  o-row-s-24">
          <div class="{{ opt.cn ~ '__intro' }}">
            {% block intro %}
              Block: Intro!
            {% endblock %}
          </div>
        </div>
      </div>
    {% endif %}

    {# -- Block: Content -- #}
    {% if opt.content %}
      <div class="o-section">
        <div class="o-row  o-row-12  o-row-s-24">
          <div class="{{ opt.cn ~ '__content' }}">
            {% block content %}
              Block: Content!
            {% endblock %}
          </div>

          {# -- Block: Sidebar -- #}
          {% if opt.sidebar %}
            <div class="{{ opt.cn ~ '__sidebar' }}">
              {% block sidebar %}
                Block: Sidebar!
              {% endblock %}
            </div>
          {% endif %}
        </div>
      </div>
    {% endif %}
  </div>
{% endif %}
