<?php
$defaultVariant = [
    'title' => 'home',
    'status' => 'wip',
    'description' => 'home Description goes here…',
];

return [
    'meta' => [
        'title' => 'home',
        'status' => 'none',
        'visible' => true,
        'type' => 'views',
        'path' => '_views/home/',
        'description' => 'home Description goes here…'
    ],
    'variants' => [
        'home' => array_merge($defaultVariant, []),
        /*
        'home--variant' => array_merge($defaultVariant, [
            'title' => 'home Intro',
            'status' => 'wip',
            'description' => 'home Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
