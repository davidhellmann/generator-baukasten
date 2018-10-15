<?php
$defaultVariant = [
    'title' => 'Card',
    'status' => 'wip',
    'description' => 'card Description goes here…',
    'cn' => 'm-card',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'item' => [
        'title' => 'This is a card.',
        'url' => 'http://baukasten.io',
        'entryImage' => \craft\elements\Asset::find()->id('169'),
        'entryIntroText' => '<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos?</p>'
    ],
    'image' => true, // \craft\elements\Asset::find()->id('169')->one(),
    'content' => true,
    'link' => true
];

return [
    'meta' => [
        'title' => 'Card',
        'status' => 'none',
        'visible' => true,
        'type' => 'molecule',
        'path' => '_molecules/card/',
        'description' => 'card Description goes here…'
    ],
    'variants' => [
        'card' => array_merge($defaultVariant, []),
        'card--noImage' => array_merge($defaultVariant, [
            'title' => 'Card without image',
            'image' => false
        ]),
        'card--noContent' => array_merge($defaultVariant, [
            'title' => 'Card without content',
            'content' => false
        ]),
        'card--noLink' => array_merge($defaultVariant, [
            'title' => 'Card without link',
            'link' => false
        ]),
    ]
];
