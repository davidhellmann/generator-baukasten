<?php
$defaultVariant = [
    'title' => 'appFooter',
    'status' => 'wip',
    'description' => 'appFooter Description goes here…',
    'cn' => 'o-appFooter',
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
        'title' => 'appFooter',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/appFooter/',
        'description' => 'appFooter Description goes here…'
    ],
    'variants' => [
        'appFooter' => array_merge($defaultVariant, []),
        /*
        'appFooter--variant' => array_merge($defaultVariant, [
            'title' => 'appFooter Intro',
            'status' => 'wip',
            'description' => 'appFooter Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
