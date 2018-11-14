<?php
// Describe your component
$componentMeta = [
    'title' => 'tag',
    'status' => 'none',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/tag/',
    'description' => 'tag Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'Tag',
    'status' => '',
    'description' => 'tag Description goes here…',
    'cn' => 'a-tag',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'link' => null,
    'text' => 'This is a tag',
];

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'tag' => array_merge($defaultVariant, []),
        'tag--variantName' => array_merge($defaultVariant, [
            'title' => 'Tag Link',
            'link' => 'http://baukasten.io'
        ]),
    ]
];
