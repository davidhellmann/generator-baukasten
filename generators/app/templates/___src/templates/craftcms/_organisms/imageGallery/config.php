<?php
$defaultVariant = [
    'title' => 'Image Gallery Square Sized Thumbs',
    'status' => 'wip',
    'description' => 'imageGallery Description goes here…',
    'cn' => 'o-imageGallery',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => true,
    'waypoint' => null,
    'waypointAni' => null,
    'images' => [
        \craft\elements\Asset::find()->id('169')->one(),
        \craft\elements\Asset::find()->id('170')->one(),
        \craft\elements\Asset::find()->id('174')->one(),
        \craft\elements\Asset::find()->id('175')->one(),
        \craft\elements\Asset::find()->id('176')->one(),
        \craft\elements\Asset::find()->id('177')->one(),
        \craft\elements\Asset::find()->id('178')->one(),
        \craft\elements\Asset::find()->id('179')->one(),
        \craft\elements\Asset::find()->id('180')->one(),
        \craft\elements\Asset::find()->id('181')->one(),
        \craft\elements\Asset::find()->id('182')->one(),
        \craft\elements\Asset::find()->id('183')->one(),
    ],
    'ratio' => 'square'
];

return [
    'meta' => [
        'title' => 'imageGallery',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/imageGallery/',
        'description' => 'imageGallery Description goes here…'
    ],
    'variants' => [
        'imageGallery' => array_merge($defaultVariant, []),
        'imageGallery--landscape' => array_merge($defaultVariant, [
            'title' => 'Image Gallery Landscape Sized Thumbs',
            'ratio' => 'landscape'
        ]),
        'imageGallery--portrait' => array_merge($defaultVariant, [
            'title' => 'Image Gallery Portrait Sized Thumbs',
            'ratio' => 'portrait'
        ]),
        'imageGallery--auto' => array_merge($defaultVariant, [
            'title' => 'Image Gallery Auto Sized Thumbs',
            'ratio' => 'auto'
        ]),
    ]
];
