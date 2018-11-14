<?php
// Describe your component
$componentMeta = [
    'title' => 'accordion',
    'status' => 'none',
    'visible' => true,
    'type' => 'embed',
    'path' => '_embeds/accordion/',
    'description' => 'accordion Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'accordion',
    'status' => '',
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

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'accordion' => array_merge($defaultVariant, []),
        /*
        'accordion--variantName' => array_merge($defaultVariant, [
            'title' => 'accordion Intro',
            'description' => 'accordion Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
