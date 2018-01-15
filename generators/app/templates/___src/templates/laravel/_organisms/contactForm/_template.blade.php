
{#
  Description of what this file is for

  @package  baukasten
  @author David Hellmann [davidhellmann.com@gmail.com]

  o-contactForm
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'o-contactForm',
  modifiers: [],
  data: {},
  js: null,
  waypoint: null,
  waypointAni: null,
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.foo %}
  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'o-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %}>

    {# TODO: Contact Form Module bauen mit seperaten Feldern und Simple #}
    <form method="post" action="" accept-charset="UTF-8" class="m-form">
      {{ getCsrfInput() }}

      {% macro errorList(errors) %}
        {% if errors %}
          <ul class="m-form__errors">
            {% for error in errors %}
              <li>{{ error }}</li>
            {% endfor %}
          </ul>
        {% endif %}
      {% endmacro %}


      <input type="hidden" name="action" value="amForms/submissions/saveSubmission">
      <input type="hidden" name="handle" value="{{ form.handle }}">
      <input type="hidden" name="namespace" value="{{ form.getNamespace() }}">

      {# Normal Fields #}
      {{ form.displayField('vorname') }}
      {{ form.displayField('nachname') }}
      {{ form.displayField('firma') }}
      {{ form.displayField('strasseNr') }}
      {{ form.displayField('plz') }}
      {{ form.displayField('ort') }}
      {{ form.displayField('email') }}
      {{ form.displayField('telefon') }}

      <hr>
      {{ form.displayField('nachricht') }}

      <hr>
      <div class="form__row">
        <div class="form_field">
          <div class="m-buttonWrapper">
            <input type="submit" class="m-button  m-button--submit" value="Absenden">
          </div>
        </div>
      </div>
    </form>


  </div>
{% endif %}
