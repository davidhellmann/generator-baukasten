<?php
$defaultVariant = [
    'title' => 'logo',
    'status' => 'wip',
    'description' => 'logo Description goes here…',
    'cn' => 'a-logo',
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
        'title' => 'logo',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/logo/',
        'description' => 'logo Description goes here…'
    ],
    'variants' => [
        'logo' => array_merge($defaultVariant, []),
        /*
        'logo--variant' => array_merge($defaultVariant, [
            'title' => 'logo Intro',
            'status' => 'wip',
            'description' => 'logo Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
