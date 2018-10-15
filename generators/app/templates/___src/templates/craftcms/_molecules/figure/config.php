<?php
$defaultVariant = [
    'title' => 'Figure',
    'status' => 'wip',
    'description' => 'figure Description goes here…',
    'cn' => 'm-figure',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'image' => \craft\elements\Asset::find()->id('169')->one(),
    'caption' => true,
    'captionHeadline' => 'Caption Headline:',
    'captionText' => 'This is a caption.',
    'captionSource' => 'David Hellmann',
    'captionSourceUrl' => 'https://davidhellmann.com',
    'objectFit' => null
];

return [
    'meta' => [
        'title' => 'Figure',
        'status' => 'none',
        'visible' => true,
        'type' => 'molecule',
        'path' => '_molecules/figure/',
        'description' => 'figure Description goes here…'
    ],
    'variants' => [
        'figure' => array_merge($defaultVariant, []),
        'figure--noCaption' => array_merge($defaultVariant, [
            'title' => 'figure without caption',
            'caption' => false
        ]),
    ]
];
