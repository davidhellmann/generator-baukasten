<?php
$defaultVariant = [
    'title' => 'twoColumns',
    'status' => 'wip',
    'description' => 'twoColumns Description goes here…',
    'cn' => 'a-twoColumns',
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
        'title' => 'twoColumns',
        'status' => 'none',
        'visible' => true,
        'type' => 'embed',
        'path' => '_embeds/twoColumns/',
        'description' => 'twoColumns Description goes here…'
    ],
    'variants' => [
        'twoColumns' => array_merge($defaultVariant, []),
        /*
        'twoColumns--variant' => array_merge($defaultVariant, [
            'title' => 'twoColumns Intro',
            'status' => 'wip',
            'description' => 'twoColumns Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
