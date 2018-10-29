<?php
// Describe your component
$componentMeta = [
    'title' => 'home',
    'status' => 'wip',
    'visible' => true,
    'type' => 'views',
    'path' => '_views/home/',
    'description' => 'home Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'home',
    'status' => '',
    'description' => 'home Description goes here…',
];

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'home' => array_merge($defaultVariant, []),
        /*
        'home--variantName' => array_merge($defaultVariant, [
            'title' => 'home Intro',
            'description' => 'home Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
