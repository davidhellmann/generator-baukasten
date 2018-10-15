<?php
$defaultVariant = [
    'title' => 'imageCover',
    'status' => 'wip',
    'description' => 'imageCover Description goes here…',
    'cn' => 'o-imageCover',
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
        'title' => 'imageCover',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/imageCover/',
        'description' => 'imageCover Description goes here…'
    ],
    'variants' => [
        'imageCover' => array_merge($defaultVariant, []),
        /*
        'imageCover--variant' => array_merge($defaultVariant, [
            'title' => 'imageCover Intro',
            'status' => 'wip',
            'description' => 'imageCover Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
