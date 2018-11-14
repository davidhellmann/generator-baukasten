<?php
// Describe your component
$componentMeta = [
    'title' => 'svgIcon',
    'status' => 'none',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/svgIcon/',
    'description' => 'svgIcon Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'SVG Icon 24',
    'status' => '',
    'description' => 'svgIcon Description goes here…',
    'cn' => 'a-svgIcon',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'icon' => 'social/instagram',
];

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'svgIcon--24' => array_merge($defaultVariant, []),
        'svgIcon--32' => array_merge($defaultVariant, [
            'title' => 'SVG Icon 32',
            'modifiers' => ['32'],
        ]),
        'svgIcon--48' => array_merge($defaultVariant, [
            'title' => 'SVG Icon 48',
            'modifiers' => ['48'],
        ]),
        'svgIcon--64' => array_merge($defaultVariant, [
            'title' => 'SVG Icon 64',
            'modifiers' => ['64'],
        ]),
        'svgIcon--96' => array_merge($defaultVariant, [
            'title' => 'SVG Icon 96',
            'modifiers' => ['96'],
        ]),
    ]
];
