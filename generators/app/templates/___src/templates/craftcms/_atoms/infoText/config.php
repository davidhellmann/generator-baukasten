<?php
$defaultVariant = [
    'title' => 'infoText',
    'status' => 'wip',
    'description' => 'infoText Description goes here…',
    'cn' => 'a-infoText',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'text' => 'Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos?',
];

return [
    'meta' => [
        'title' => 'infoText',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/infoText/',
        'description' => 'infoText Description goes here…'
    ],
    'variants' => [
        'infoText' => array_merge($defaultVariant, []),
        /*
        'infoText--variant' => array_merge($defaultVariant, [
            'title' => 'infoText Intro',
            'status' => 'wip',
            'description' => 'infoText Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
