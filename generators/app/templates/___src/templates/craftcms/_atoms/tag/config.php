<?php
$defaultVariant = [
    'title' => 'Tag',
    'status' => 'wip',
    'description' => 'tag Description goes here…',
    'cn' => 'a-tag',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'link' => null,
    'text' => 'This is a tag',
];

return [
    'meta' => [
        'title' => 'tag',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/tag/',
        'description' => 'tag Description goes here…'
    ],
    'variants' => [
        'tag' => array_merge($defaultVariant, []),
        'tag--variant' => array_merge($defaultVariant, [
            'title' => 'Tag Link',
            'link' => 'http://baukasten.io'
        ]),
    ]
];
