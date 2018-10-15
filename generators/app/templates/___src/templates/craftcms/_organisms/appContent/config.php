<?php
$defaultVariant = [
    'title' => 'appContent',
    'status' => 'wip',
    'description' => 'appContent Description goes here…',
    'cn' => 'o-appContent',
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
        'title' => 'appContent',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/appContent/',
        'description' => 'appContent Description goes here…'
    ],
    'variants' => [
        'appContent' => array_merge($defaultVariant, []),
        /*
        'appContent--variant' => array_merge($defaultVariant, [
            'title' => 'appContent Intro',
            'status' => 'wip',
            'description' => 'appContent Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
