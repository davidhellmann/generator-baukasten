<?php
$defaultVariant = [
    'title' => 'label',
    'status' => 'wip',
    'description' => 'label Description goes here…',
    'cn' => 'a-label',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'element' => 'label',
    'text' => 'This is a label.',
];

return [
    'meta' => [
        'title' => 'label',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/label/',
        'description' => 'label Description goes here…'
    ],
    'variants' => [
        'label' => array_merge($defaultVariant, []),
        /*
        'label--variant' => array_merge($defaultVariant, [
            'title' => 'label Intro',
            'status' => 'wip',
            'description' => 'label Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
