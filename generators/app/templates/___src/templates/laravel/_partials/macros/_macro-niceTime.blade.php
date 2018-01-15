
{#
  Set Active Class
  ------------------------------------------------------------

  {{ macroNiceTime.niceTime(options) }}
#}

{% macro niceTime(options) %}
  {% set defaults = {
    classname: 'm-niceTime',
    date: false
  } %}

  {% if options is defined %}
    {% set options = options is defined ? defaults|merge(options) : defaults %}
  {% else %}
    {% set options = defaults %}
  {% endif %}

  {% set niceTime = date(options.date).diff(now) %}
  {% if niceTime %}
    <span class="{{ options.classname }}">
      <span class="{{ options.classname ~ '__inner' }}">
        {% if niceTime.y >= 2 %}
          {{ 'am' | t }} {{ date|date('F Y') }}
        {% elseif niceTime.y >= 1 %}
          {{ 'Vor einem Jahr' | t }}
        {% elseif niceTime.m >= 2 %}
          {{ 'vor' | t }} {{ niceTime.m }} {{ 'Monaten' | t }}
        {% elseif niceTime.m >= 1 %}
          {{ 'vor einem Monat' | t }}
        {% elseif niceTime.d >= 2 %}
          {{ 'vor' | t }} {{ niceTime.d }} {{ 'Tagen' | t }}
        {% elseif niceTime.d >= 1 %}
          {{ 'vor einem Tag' | t }}
        {% elseif niceTime.h >= 2 %}
          {{ 'vor' | t }} {{ niceTime.h }} {{ 'Stunden' | t }}
        {% elseif niceTime.h >= 1 %}
          {{ 'vor einer Stunde' | t }}
        {% elseif niceTime.i >= 2 %}
          {{ 'vor wenigen Minuten' | t }}
        {% else %}
          {{ 'gerade eben' | t }}
        {% endif %}
      </span>
    </span>
  {% endif %}
{% endmacro %}
