<?php
$defaultVariant = [
    'title' => 'embed',
    'status' => 'wip',
    'description' => 'embed Description goes here…',
    'cn' => 'a-embed',
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
        'title' => 'embed',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/embed/',
        'description' => 'embed Description goes here…'
    ],
    'variants' => [
        'embed' => array_merge($defaultVariant, []),
        /*
        'embed--variant' => array_merge($defaultVariant, [
            'title' => 'embed Intro',
            'status' => 'wip',
            'description' => 'embed Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
