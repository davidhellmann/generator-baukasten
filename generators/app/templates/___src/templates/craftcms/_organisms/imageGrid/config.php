<?php
$defaultVariant = [
    'title' => 'Image Grid Two Columns',
    'status' => 'wip',
    'description' => 'imageGrid Description goes here…',
    'cn' => 'o-imageGrid',
    'modifiers' => ['c-2'],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'images' => [
        \craft\elements\Asset::find()->id('169')->one(),
        \craft\elements\Asset::find()->id('170')->one(),
    ],
    'ratio' => 'portrait'
];

return [
    'meta' => [
        'title' => 'imageGrid',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/imageGrid/',
        'description' => 'imageGrid Description goes here…'
    ],
    'variants' => [
        'imageGrid' => array_merge($defaultVariant, []),
        'imageGrid--c-2-landscape' => array_merge($defaultVariant, [
            'title' => 'Image Grid Two Columns Landscape',
            'ratio' => 'landscape'
        ]),
        'imageGrid--c-2-square' => array_merge($defaultVariant, [
            'title' => 'Image Grid Two Columns Square',
            'ratio' => 'square'
        ]),
        'imageGrid--c-2-auto' => array_merge($defaultVariant, [
            'title' => 'Image Grid Two Columns Auto',
            'ratio' => 'auto'
        ]),
        'imageGrid--c-2-portrait-caption' => array_merge($defaultVariant, [
            'title' => 'Image Grid Two Columns Portrait with Caption',
            'ratio' => 'portrait',
            'caption' => true
        ]),
        'imageGrid--c-3' => array_merge($defaultVariant, [
            'title' => 'Image Grid Three Columns',
            'images' => [
                \craft\elements\Asset::find()->id('169')->one(),
                \craft\elements\Asset::find()->id('170')->one(),
                \craft\elements\Asset::find()->id('180')->one(),
            ],
            'modifiers' => ['c-3'],
        ]),
        'imageGrid--c-4' => array_merge($defaultVariant, [
            'title' => 'Image Grid Four Columns',
            'images' => [
                \craft\elements\Asset::find()->id('169')->one(),
                \craft\elements\Asset::find()->id('170')->one(),
                \craft\elements\Asset::find()->id('180')->one(),
                \craft\elements\Asset::find()->id('181')->one(),
            ],
            'modifiers' => ['c-4'],
        ]),
        'imageGrid--single' => array_merge($defaultVariant, [
            'title' => 'Image Grid One Column',
            'modifiers' => [],
            'images' => [
                \craft\elements\Asset::find()->id('169')->one(),
            ],
        ]),
    ]
];
