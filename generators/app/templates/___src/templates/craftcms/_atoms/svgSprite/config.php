<?php
// Describe your component
$componentMeta = [
    'title' => 'svgSprite',
    'status' => 'none',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/svgSprite/',
    'description' => 'svgSprite Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'SVG Sprite 24',
    'status' => '',
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

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
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
