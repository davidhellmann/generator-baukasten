<?php
$defaultVariant = [
    'title' => 'Image Single Landscape',
    'status' => 'wip',
    'description' => 'imageSingle Description goes here…',
    'cn' => 'o-imageSingle',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'image' => \craft\elements\Asset::find()->id('169')->one(),
    'ratio' => 'landscape'
];

return [
    'meta' => [
        'title' => 'imageSingle',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/imageSingle/',
        'description' => 'imageSingle Description goes here…'
    ],
    'variants' => [
        'imageSingle' => array_merge($defaultVariant, []),
        'imageSingle--landscape-caption' => array_merge($defaultVariant, [
            'title' => 'Image Single Landscape with caption',
            'ratio' => 'landscape',
            'caption' => true
        ]),
        'imageSingle--portrait' => array_merge($defaultVariant, [
            'title' => 'Image Single Portrait',
            'ratio' => 'portrait'
        ]),
        'imageSingle--square' => array_merge($defaultVariant, [
            'title' => 'Image Single Square',
            'ratio' => 'square'
        ]),
        'imageSingle--auto' => array_merge($defaultVariant, [
            'title' => 'Image Single Auto',
            'ratio' => 'auto'
        ]),
    ]
];
