<?php
// Describe your component
$componentMeta = [
    'title' => 'imageGallery',
    'status' => 'wip',
    'visible' => true,
    'type' => 'organism',
    'path' => '_organisms/imageGallery/',
    'description' => 'imageGallery Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'Image Gallery Square Sized Thumbs',
    'status' => '',
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

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
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
