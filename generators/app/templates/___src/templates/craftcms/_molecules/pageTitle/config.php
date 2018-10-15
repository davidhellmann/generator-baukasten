<?php
$defaultVariant = [
    'title' => 'PageTitle',
    'status' => 'wip',
    'description' => 'pageTitle Description goes here…',
    'cn' => 'm-pageTitle',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'object' =>null,
    'text' => 'This is an awesome Pagetitle',
    'size' => 'h1',
    'link' => 'http://baukasten.io'
];

return [
    'meta' => [
        'title' => 'PageTitle',
        'status' => 'none',
        'visible' => true,
        'type' => 'molecule',
        'path' => '_molecules/pageTitle/',
        'description' => 'pageTitle Description goes here…'
    ],
    'variants' => [
        'pageTitle' => array_merge($defaultVariant, []),
        'pageTitle--noLink' => array_merge($defaultVariant, [
            'title' => 'PageTitle without link',
            'link' => null
        ]),
    ]
];
