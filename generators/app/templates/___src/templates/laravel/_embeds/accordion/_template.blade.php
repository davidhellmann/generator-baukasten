
{#
  Accordion
  =========
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'e-accordion',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# Modul #}
<div class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.js ? opt.cn|replace({ 'e-' : 'js-' }) : '' }}
            {{ opt.waypointAni ? opt.waypointAni : '' }}"
    {{ opt.waypoint ? ' data-waypoint' : '' }}
    {% for key, value in opt.data %}
      {{ 'data-' ~ key ~ '=' ~ value }}
    {% endfor %}> role="tablist">
  <div class="{{ opt.cn ~ '__item' }}" role="tab">
    <div class="{{ opt.cn ~ '__trigger' }}  js-accordionTrigger">
      <div class="{{ opt.cn ~ '__headline' }}">
        {% block trigger %}
          Trigger
        {% endblock %}
      </div>
    </div>

    <div class="{{ opt.cn ~ '__content' }}" role="tabpanel">
      {% block content %}
        Content
      {% endblock %}
    </div>
  </div>
</div>
