<?php
$defaultVariant = [
    'title' => 'Quote',
    'status' => 'wip',
    'description' => 'quote Description goes here…',
    'cn' => 'm-quote',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'quote' => 'Everyone is a genius at least once a year. The real geniuses simply have their bright ideas closer together.',
    'source' => 'Georg C. Lichtenberg',
    'sourceUrl' => 'https://www.brainyquote.com/authors/georg_c_lichtenberg'
];

return [
    'meta' => [
        'title' => 'Quote',
        'status' => 'none',
        'visible' => true,
        'type' => 'molecule',
        'path' => '_molecules/quote/',
        'description' => 'quote Description goes here…'
    ],
    'variants' => [
        'quote' => array_merge($defaultVariant, []),
        'quote--noSource' => array_merge($defaultVariant, [
            'title' => 'Quote without source',
            'source' => null
        ]),
    ]
];
