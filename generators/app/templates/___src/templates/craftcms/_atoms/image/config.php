<?php
$defaultVariant = [
    'title' => 'Image landscape',
    'status' => 'done',
    'description' => 'This is an image in landscape mode.',
    'cn' => 'a-image',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'ratio' => 'landscape',
    'dominantColor' => true,
    'objectFit' => null,
    'maxWidth' => null,
    'image' => \craft\elements\Asset::find()->id('169')->one(),
];

return [
    'meta' => [
        'title' => 'image',
        'status' => 'done',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/image/',
        'description' => 'Default Image Formats.'
    ],
    'variants' => [
        'image--landscape' => array_merge($defaultVariant, []),
        'image--portrait' => array_merge($defaultVariant, [
            'title' => 'Image portrait',
            'status' => 'done',
            'description' => 'This is an image in portrait mode.',
            'ratio' => 'portrait',
        ]),
        'image--square' => array_merge($defaultVariant, [
            'title' => 'Image square',
            'status' => 'done',
            'description' => 'This is an image in square mode.',
            'ratio' => 'square',
        ]),
    ]
];
