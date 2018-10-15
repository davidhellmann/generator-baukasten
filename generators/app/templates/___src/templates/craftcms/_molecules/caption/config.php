<?php
$defaultVariant = [
    'title' => 'Caption',
    'status' => 'wip',
    'description' => 'caption Description goes here…',
    'cn' => 'm-caption',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'element' => 'figcaption',
    'headline' => 'Caption headline:',
    'text' => 'This is a caption maybe for an image.',
    'source' => 'David Hellmann',
    'sourceUrl' => 'https://davidhellmann.com'
];

return [
    'meta' => [
        'title' => 'Caption',
        'status' => 'none',
        'visible' => true,
        'type' => 'molecule',
        'path' => '_molecules/caption/',
        'description' => 'caption Description goes here…'
    ],
    'variants' => [
        'caption' => array_merge($defaultVariant, []),
        'caption--noHeadline' => array_merge($defaultVariant, [
            'title' => 'Caption without headline',
            'headline' => null
        ]),
        'caption--noSource' => array_merge($defaultVariant, [
            'title' => 'Caption without source',
            'source' => null,
            'sourceUrl' => null
        ]),
    ],
];
