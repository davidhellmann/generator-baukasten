
{% set pageInfo = pageInfo %}

{% if pageInfo.prevUrl %}<link rel="prev" href="{{ pageInfo.prevUrl }}">{% endif %}
{% if pageInfo.nextUrl %}<link rel="next" href="{{ pageInfo.nextUrl }}">{% endif %}
