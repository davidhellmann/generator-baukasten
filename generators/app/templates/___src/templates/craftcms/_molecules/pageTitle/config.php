<?php
// Describe your component
$componentMeta = [
    'title' => 'PageTitle',
    'status' => 'wip',
    'visible' => true,
    'type' => 'molecule',
    'path' => '_molecules/pageTitle/',
    'description' => 'pageTitle Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'PageTitle',
    'status' => '',
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

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'pageTitle' => array_merge($defaultVariant, []),
        'pageTitle--noLink' => array_merge($defaultVariant, [
            'title' => 'PageTitle without link',
            'link' => null
        ]),
    ]
];
