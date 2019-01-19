<?php
// Describe your component
$componentMeta = [
    'title' => 'imageSlider',
    'status' => 'none',
    'visible' => true,
    'type' => 'organism',
    'path' => '_organisms/imageSlider/',
    'description' => 'imageSlider Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'Image Slider Landscape Sized',
    'status' => '',
    'description' => 'imageSlider Description goes here…',
    'cn' => 'o-imageSlider',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => true,
    'waypoint' => null,
    'waypointAni' => null,
    'images' => [
        \craft\elements\Asset::find()->id('10')->one(),
        \craft\elements\Asset::find()->id('12')->one(),
        \craft\elements\Asset::find()->id('25')->one(),
        \craft\elements\Asset::find()->id('21')->one(),
        \craft\elements\Asset::find()->id('23')->one(),
        \craft\elements\Asset::find()->id('20')->one(),
        \craft\elements\Asset::find()->id('19')->one(),
        \craft\elements\Asset::find()->id('18')->one(),
        \craft\elements\Asset::find()->id('17')->one(),
        \craft\elements\Asset::find()->id('16')->one(),
        \craft\elements\Asset::find()->id('15')->one(),
        \craft\elements\Asset::find()->id('14')->one(),
    ],
    'caption' => false,
    'ratio' => 'landscape',
];

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'imageSlider' => array_merge($defaultVariant, []),
        'imageSlider--landscape-caption' => array_merge($defaultVariant, [
            'title' => 'Image Slider Landscape Sized with Caption',
            'caption' => true
        ]),
        'imageSlider--square' => array_merge($defaultVariant, [
            'title' => 'Image Slider Square Sized',
            'ratio' => 'square'
        ]),
        'imageSlider--portrait' => array_merge($defaultVariant, [
            'title' => 'Image Slider Portrait Sized',
            'ratio' => 'portrait'
        ]),
        'imageSlider--auto' => array_merge($defaultVariant, [
            'title' => 'Image Slider Auto Sized',
            'ratio' => 'auto'
        ]),
    ]
];
