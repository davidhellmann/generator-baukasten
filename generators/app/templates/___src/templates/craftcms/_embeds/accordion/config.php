<?php
$defaultVariant = [
    'title' => 'accordion',
    'status' => 'wip',
    'description' => 'accordion Description goes here…',
    'cn' => 'a-accordion',
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
        'title' => 'accordion',
        'status' => 'none',
        'visible' => true,
        'type' => 'embed',
        'path' => '_embeds/accordion/',
        'description' => 'accordion Description goes here…'
    ],
    'variants' => [
        'accordion' => array_merge($defaultVariant, []),
        /*
        'accordion--variant' => array_merge($defaultVariant, [
            'title' => 'accordion Intro',
            'status' => 'wip',
            'description' => 'accordion Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
