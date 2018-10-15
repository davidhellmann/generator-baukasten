<?php
$defaultVariant = [
    'title' => 'preloader',
    'status' => 'wip',
    'description' => 'preloader Description goes here…',
    'cn' => 'a-preloader',
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
        'title' => 'preloader',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/preloader/',
        'description' => 'preloader Description goes here…'
    ],
    'variants' => [
        'preloader' => array_merge($defaultVariant, []),
        /*
        'preloader--variant' => array_merge($defaultVariant, [
            'title' => 'preloader Intro',
            'status' => 'wip',
            'description' => 'preloader Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
