<?php
$defaultVariant = [
    'title' => 'Select',
    'status' => 'wip',
    'description' => 'select Description goes here…',
    'cn' => 'a-select',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'array' => ['foo', 'bar'],
];

return [
    'meta' => [
        'title' => 'select',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/select/',
        'description' => 'select Description goes here…'
    ],
    'variants' => [
        'select' => array_merge($defaultVariant, []),
        'select--variant' => array_merge($defaultVariant, [
            'title' => 'Select disabled',
            'status' => 'wip',
            'disabled' => true
        ]),
        'input--firstOption' => array_merge($defaultVariant, [
            'title' => 'Input custom first option',
            'status' => 'wip',
            'firstOption' => [
                'text' => 'Please select',
                'value' => 'not set'
            ]
        ]),
    ]
];
