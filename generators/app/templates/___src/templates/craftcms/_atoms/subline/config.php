<?php
$defaultVariant = [
    'title' => 'subline',
    'status' => 'wip',
    'description' => 'subline Description goes here…',
    'cn' => 'a-subline',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'text' => 'The quick brown fox jumps over the lazy dog.',
    'size' => 'h2'
];

return [
    'meta' => [
        'title' => 'subline',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/subline/',
        'description' => 'subline Description goes here…'
    ],
    'variants' => [
        'subline' => array_merge($defaultVariant, []),
        /*
        'subline--variant' => array_merge($defaultVariant, [
            'title' => 'subline Intro',
            'status' => 'wip',
            'description' => 'subline Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
