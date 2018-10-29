<?php
// Describe your component
$componentMeta = [
    'title' => 'twoColumns',
    'status' => 'wip',
    'visible' => true,
    'type' => 'embed',
    'path' => '_embeds/twoColumns/',
    'description' => 'twoColumns Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'twoColumns',
    'status' => '',
    'description' => 'twoColumns Description goes here…',
    'cn' => 'a-twoColumns',
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
        'twoColumns' => array_merge($defaultVariant, []),
        /*
        'twoColumns--variantName' => array_merge($defaultVariant, [
            'title' => 'twoColumns Intro',
            'description' => 'twoColumns Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
