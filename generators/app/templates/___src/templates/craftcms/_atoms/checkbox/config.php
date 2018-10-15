<?php
$defaultVariant = [
    'title' => 'Checkbox default',
    'status' => 'wip',
    'description' => 'checkbox Description goes here…',
    'cn' => 'a-checkbox',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'name' => 'sample',
    'disabled' => null,
    'checked' => null,
    'label' => 'Sample checkbox',
    'id' => 'sample',
    'value' => null
];

return [
    'meta' => [
        'title' => 'checkbox',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/checkbox/',
        'description' => 'checkbox Description goes here…'
    ],
    'variants' => [
        'checkbox' => array_merge($defaultVariant, []),
        'checkbox--disabled' => array_merge($defaultVariant, [
            'title' => 'Checkbox disabled',
            'status' => 'wip',
            'disabled' => true,
            'modifiers' => ['styleDisabled'],
        ]),
    ]
];
