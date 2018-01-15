
{#
  A&M Nav
  =======

  {{ macroAmNav.amNav(node, loop.index) }}
#}
{% set classname = classname|default('m-nav') %}
{% macro amNav(node, index, classname) %}
  {%- set navNameSpaces = '' -%}
  {%- set urlNameSpace = craft.request.getSegment(2) -%}
  {%- if node.listClass|length -%}
    {%- set navNameSpaces = node.listClass|split(',')  -%}
  {%- endif -%}
  {%- set nodeClasses = [classname ~ '__item'] -%}
  {%- if node.hasChildren -%}
    {%- set nodeClasses = nodeClasses|merge(['has-children']) -%}
  {%- endif -%}
  {%- if node.active or node.hasActiveChild -%}
    {%- set nodeClasses = nodeClasses|merge(['is-active']) -%}
  {%- endif -%}
  {%- for navNameSpace in navNameSpaces -%}
    {%- if urlNameSpace starts with navNameSpace -%}
      {%- set nodeClasses = nodeClasses|merge(['is-active']) -%}
    {%- endif -%}
  {%- endfor -%}
  {%- if node.level == 1 and index == 1 -%}
    {%- set nodeClasses = nodeClasses|merge(['is-first']) -%}
  {%- endif -%}
  {%- if node.listClass|length -%}
    {%- set nodeClasses = nodeClasses|merge([node.listClass]) -%}
  {%- endif -%}

  <li{% if nodeClasses|length %} class="{{ nodeClasses|join(' ') }}"{% endif %}>
    <a class="{{ classname ~ '__link' }}" href="{{ node.url }}" title="{{ node.name }}"{% if node.blank %} target="_blank"{% endif %}>{{ node.name }}</a>
    {% if node.hasChildren %}
      <ul class="{{ classname ~ '__subList' }}  {{ classname ~ '__subList--' ~ (node.level + 1) }}">
        {% for subnode in node.children %}
          {{ _self.addNodeToNavigation(subnode, loop.index) }}
        {% endfor %}
      </ul>
    {% endif %}
  </li>
{% endmacro %}
