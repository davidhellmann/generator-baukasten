<?php
$defaultVariant = [
    'title' => 'contactForm',
    'status' => 'wip',
    'description' => 'contactForm Description goes here…',
    'cn' => 'o-contactForm',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'foo' => null,
];

return [
    'meta' => [
        'title' => 'contactForm',
        'status' => 'none',
        'visible' => true,
        'type' => 'organism',
        'path' => '_organisms/contactForm/',
        'description' => 'contactForm Description goes here…'
    ],
    'variants' => [
        'contactForm' => array_merge($defaultVariant, []),
        /*
        'contactForm--variant' => array_merge($defaultVariant, [
            'title' => 'contactForm Intro',
            'status' => 'wip',
            'description' => 'contactForm Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
