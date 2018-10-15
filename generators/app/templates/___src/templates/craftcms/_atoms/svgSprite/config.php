<?php
$defaultVariant = [
    'title' => 'SVG Sprite 24',
    'status' => 'wip',
    'description' => 'svgSprite Description goes here…',
    'cn' => 'a-svgSprite',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'icon' => 'instagram',
];

return [
    'meta' => [
        'title' => 'svgSprite',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/svgSprite/',
        'description' => 'svgSprite Description goes here…'
    ],
    'variants' => [
        'svgSprite--24' => array_merge($defaultVariant, []),
        'svgSprite--32' => array_merge($defaultVariant, [
            'title' => 'SVG Sprite 32',
            'modifiers' => ['32'],
        ]),
        'svgSprite--48' => array_merge($defaultVariant, [
            'title' => 'SVG Sprite 48',
            'modifiers' => ['48'],
        ]),
        'svgSprite--64' => array_merge($defaultVariant, [
            'title' => 'SVG Sprite 64',
            'modifiers' => ['64'],
        ]),
        'svgSprite--96' => array_merge($defaultVariant, [
            'title' => 'SVG Sprite 96',
            'modifiers' => ['96'],
        ]),
    ]
];
