
{#
  o-section
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-section',
  modifiers: [],
  offset: null,
  context: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Colums Context -- #}
{% set context = opt.context | split(':') %}
{% set contextFirst = context[0] %}
{% set contextLast = context[1] %}
{% set offset = '' %}

{% if opt.offset == 'yes' %}
  {% set offsetValue = 4 %}
  {% set contextLast = contextLast - offsetValue %}
  {% set offsetValue = offsetValue + 1  %}
  {% set offset = 'o-col-sa-s-' ~ offsetValue %}
{% endif %}

{# -- Modul -- #}
<div class="{{ opt.cn }}
            {% for modifier in opt.modifiers %}
              {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
            {% endfor %}  {{ opt.cn|replace({ 'o-' : 'js-' }) }}">
  <div class="{{ 'o-row-' ~ contextFirst ~  '  o-row-s-' ~ contextLast }}">
    <div class="{{ 'o-col-' ~ contextFirst ~  '  o-col-s-' ~ contextLast }}  {{ offset }}">
