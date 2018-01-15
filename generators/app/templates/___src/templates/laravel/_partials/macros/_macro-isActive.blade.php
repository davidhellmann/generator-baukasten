
{#
  Set Active Class
  ------------------------------------------------------------

  {{ macroIsActive.isActive('news', -1, 'classname') }}
#}

{% macro isActive(segment, position, classname) %}
  {% set segment = segment|default('news') %}
  {% set position = position|default(-1) %}
  {% set classname = classname|default('is-active') %}

  {% if craft.app.request.getSegment(position) == segment %}
    {{ classname }}
  {% endif %}
{% endmacro %}
