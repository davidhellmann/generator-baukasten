<?php
$defaultVariant = [
    'title' => 'divider',
    'status' => 'wip',
    'description' => 'divider Description goes here…',
    'cn' => 'a-divider',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'text' => 'divider lorem ipsum dolor sit amet…',
    'open' => true,
    'textShow' => 'Expand Code Block',
    'textHide' => 'Collapse Code Block',
    'snippet' => '<div class="foo">Foo Bar</div>',
    'language' => 'html'
];


return [
    'meta' => [
        'title' => 'divider',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/divider/',
        'description' => 'divider Description goes here…'
    ],
    'variants' => [
        'divider' => array_merge($defaultVariant, []),
        /*
        'divider--variant' => array_merge($defaultVariant, [
            'title' => 'divider Intro',
            'status' => 'wip',
            'description' => 'divider Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
