<?php
$defaultVariant = [
    'title' => 'section',
    'status' => 'wip',
    'description' => 'section Description goes here…',
    'cn' => 'o-section',
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
        'title' => 'section',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/section/',
        'description' => 'section Description goes here…'
    ],
    'variants' => [
        'section' => array_merge($defaultVariant, []),
        /*
        'section--variant' => array_merge($defaultVariant, [
            'title' => 'section Intro',
            'status' => 'wip',
            'description' => 'section Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
