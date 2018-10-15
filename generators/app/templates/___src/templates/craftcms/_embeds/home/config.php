<?php
$defaultVariant = [
    'title' => 'home',
    'status' => 'wip',
    'description' => 'home Description goes here…',
    'cn' => 'a-home',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'foo' => null,
];

return [
    'meta' => [
        'title' => 'home',
        'status' => 'none',
        'visible' => true,
        'type' => 'embed',
        'path' => '_embeds/home/',
        'description' => 'home Description goes here…'
    ],
    'variants' => [
        'home' => array_merge($defaultVariant, []),
        /*
        'home--variant' => array_merge($defaultVariant, [
            'title' => 'home Intro',
            'status' => 'wip',
            'description' => 'home Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
