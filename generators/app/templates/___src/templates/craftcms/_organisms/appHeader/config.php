<?php
$defaultVariant = [
    'title' => 'appHeader',
    'status' => 'wip',
    'description' => 'appHeader Description goes here…',
    'cn' => 'o-appHeader',
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
        'title' => 'appHeader',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/appHeader/',
        'description' => 'appHeader Description goes here…'
    ],
    'variants' => [
        'appHeader' => array_merge($defaultVariant, []),
        /*
        'appHeader--variant' => array_merge($defaultVariant, [
            'title' => 'appHeader Intro',
            'status' => 'wip',
            'description' => 'appHeader Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
