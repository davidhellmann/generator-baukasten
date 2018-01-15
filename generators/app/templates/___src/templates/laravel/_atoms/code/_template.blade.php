
{#
  a-code
  ------------------------------------------------------------
#}

{# -- Set Defaults -- #}
{% set defaults = {
  cn: 'a-code',
  modifiers: [],
  data: {},
  js: true,
  waypoint: null,
  waypointAni: null,
  open: true,
  textShow: 'Expand Code Block',
  textHide: 'Collapse Code Block',
  code: null,
  lang: null
} %}

{# -- Merge Default with Options -- #}
{% set opt = opt is defined ? defaults|merge(opt) : defaults %}

{# -- Modul -- #}
{% if opt.code %}
  <div class="{{ opt.cn }}
              {% for modifier in opt.modifiers %}
                {{ modifier | length ? '  ' ~ opt.cn ~ '--' ~ modifier }}
              {% endfor %}  {{ opt.js ? opt.cn|replace({ 'a-' : 'js-' }) : '' }}
              {{ opt.waypointAni ? opt.waypointAni : '' }}"
              {{ opt.waypoint ? ' data-waypoint' : '' }}
              {% for key, value in opt.data %}
                {{ 'data-' ~ key ~ '=' ~ value }}
              {% endfor %} data-status="{{ opt.open ? 'open' : 'closed' }}">
    <pre class="line-numbers  language-{{ opt.lang }}  {{ opt.cn ~ '__codeWrapper' }}">
      <code class="{{ opt.cn ~ '__code' }}">
        {{- opt.code | e -}}
      </code>
    </pre>
  </div>
  <span class="{{ opt.cn ~ '__toggle' }}"
        data-status="{{ opt.open ? 'open' : 'closed' }}"
        data-show="{{ opt.textShow }}"
        data-hide="{{ opt.textHide }}">
    <span class="{{ opt.cn ~ '__toggleTextHolder' }} js-textHolder">{{ opt.open ? opt.textHide : opt.textShow  }}</span>
  </span>
{% endif %}
