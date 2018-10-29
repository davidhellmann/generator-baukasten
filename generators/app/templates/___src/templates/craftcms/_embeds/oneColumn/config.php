<?php
// Describe your component
$componentMeta = [
    'title' => 'oneColumn',
    'status' => 'wip',
    'visible' => true,
    'type' => 'embed',
    'path' => '_embeds/oneColumn/',
    'description' => 'oneColumn Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'oneColumn',
    'status' => '',
    'description' => 'oneColumn Description goes here…',
    'cn' => 'a-oneColumn',
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
        'oneColumn' => array_merge($defaultVariant, []),
        /*
        'oneColumn--variantName' => array_merge($defaultVariant, [
            'title' => 'oneColumn Intro',
            'description' => 'oneColumn Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
