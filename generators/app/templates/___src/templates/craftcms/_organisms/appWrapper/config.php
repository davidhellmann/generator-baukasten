<?php
$defaultVariant = [
    'title' => 'appWrapper',
    'status' => 'wip',
    'description' => 'appWrapper Description goes here…',
    'cn' => 'o-appWrapper',
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
        'title' => 'appWrapper',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/appWrapper/',
        'description' => 'appWrapper Description goes here…'
    ],
    'variants' => [
        'appWrapper' => array_merge($defaultVariant, []),
        /*
        'appWrapper--variant' => array_merge($defaultVariant, [
            'title' => 'appWrapper Intro',
            'status' => 'wip',
            'description' => 'appWrapper Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
