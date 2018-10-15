<?php
$defaultVariant = [
    'title' => 'oneColumn',
    'status' => 'wip',
    'description' => 'oneColumn Description goes here…',
    'cn' => 'a-oneColumn',
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
        'title' => 'oneColumn',
        'status' => 'none',
        'visible' => true,
        'type' => 'embed',
        'path' => '_embeds/oneColumn/',
        'description' => 'oneColumn Description goes here…'
    ],
    'variants' => [
        'oneColumn' => array_merge($defaultVariant, []),
        /*
        'oneColumn--variant' => array_merge($defaultVariant, [
            'title' => 'oneColumn Intro',
            'status' => 'wip',
            'description' => 'oneColumn Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
