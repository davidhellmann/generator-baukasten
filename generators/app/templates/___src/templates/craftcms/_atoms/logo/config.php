<?php
// Describe your component
$componentMeta = [
    'title' => 'logo',
    'status' => 'wip',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/logo/',
    'description' => 'logo Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'logo',
    'status' => '',
    'description' => 'logo Description goes here…',
    'cn' => 'a-logo',
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
        'logo' => array_merge($defaultVariant, []),
        /*
        'logo--variantName' => array_merge($defaultVariant, [
            'title' => 'logo Intro',
            'description' => 'logo Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
