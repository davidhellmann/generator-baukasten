<?php
// Describe your component
$componentMeta = [
    'title' => 'preloader',
    'status' => 'wip',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/preloader/',
    'description' => 'preloader Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'preloader',
    'status' => '',
    'description' => 'preloader Description goes here…',
    'cn' => 'a-preloader',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'foo' => null,
];

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'preloader' => array_merge($defaultVariant, []),
        /*
        'preloader--variantName' => array_merge($defaultVariant, [
            'title' => 'preloader Intro',
            'description' => 'preloader Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
