<?php
$defaultVariant = [
    'title' => 'Link primary',
    'status' => 'wip',
    'description' => 'This is a primary link.',
    'cn' => 'a-link',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'url' => 'http://baukasten.io',
    'targetBlank' => null,
    'text' => 'This is a link',
    'icon' => null,
];

return [
    'meta' => [
        'title' => 'link',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/link/',
        'description' => 'link Description goes here…'
    ],
    'variants' => [
        'link' => array_merge($defaultVariant, []),
        'link--secondary' => array_merge($defaultVariant, [
            'title' => 'link secondary',
            'description' => 'This is a secondary link.',
            'modifiers' => ['styleSecondary'],
        ]),
        'link--inline' => array_merge($defaultVariant, [
            'title' => 'link inline',
            'description' => 'This is a inline link.',
            'modifiers' => ['inline'],
        ]),
    ]
];
