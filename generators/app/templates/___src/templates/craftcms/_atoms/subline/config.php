<?php
// Describe your component
$componentMeta = [
    'title' => 'subline',
    'status' => 'none',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/subline/',
    'description' => 'subline Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'subline',
    'status' => '',
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

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'subline' => array_merge($defaultVariant, []),
        /*
        'subline--variantName' => array_merge($defaultVariant, [
            'title' => 'subline Intro',
            'description' => 'subline Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
