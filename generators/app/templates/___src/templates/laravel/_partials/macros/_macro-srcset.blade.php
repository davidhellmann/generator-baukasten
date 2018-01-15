
{% macro srcset(image, options) %}
    {% set defaults = {
        sizes: [
            { width: 2560 },
            { width: 1920 },
            { width: 1400 },
            { width: 1100 },
            { width: 800 },
            { width: 500 },
            { width: 300 },
            { width: 10, jpegQuality: 0 }
        ],
        mode: 'crop',
        position: null,
        ratio: null,
    } %}

    {% set options = options is defined ? defaults|merge(options) : defaults %}


    {% if options.ratio %}
        {% set ratio = options.ratio|split(':') %}
        {% set ratio = ratio|first/ratio|last %}
    {% else %}
        {% set ratio = '' %}
    {% endif %}

    {# -- Set Position -- #}
    {% if options.position %}
        {% set position = options.position %}
    {% elseif image.settingsFocalPoint is defined %}
        {% set position = image.settingsFocalPoint %}
    {% else %}
        {% set position = '50% 50%' %}
    {% endif %}

    {# -- Define global variables -- #}
    {% set imageSettings = {
        mode: options.mode,
        position: position,
        ratio: ratio
    } %}

    {# -- Image -- #}
    {% set images = craft.imager.transformImage(image, options.sizes, imageSettings) %}
    {% set srcset = craft.imager.srcset(images) %}

    {{ srcset }}
{% endmacro %}
