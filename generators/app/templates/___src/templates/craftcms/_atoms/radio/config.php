<?php
$defaultVariant = [
    'title' => 'Radio',
    'status' => 'wip',
    'description' => 'radio Description goes here…',
    'cn' => 'a-radio',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'name' => 'Sample',
    'label' => 'Sample radio button',
    'disabled' => null,
    'checked' => true,
    'id' => null,
    'value' => null,
];

return [
    'meta' => [
        'title' => 'radio',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/radio/',
        'description' => 'radio Description goes here…'
    ],
    'variants' => [
        'radio--default' => array_merge($defaultVariant, []),
        'radio--disabled' => array_merge($defaultVariant, [
            'title' => 'Radio disabled',
            'status' => 'wip',
            'disabled' => true,
            'modifiers' => ['styleDisabled'],
        ]),
    ]
];
