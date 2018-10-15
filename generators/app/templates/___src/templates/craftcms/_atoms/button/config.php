<?php
$defaultVariant = [
    'title' => 'Button default',
    'status' => 'wip',
    'description' => 'button Description goes here…',
    'cn' => 'a-button',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'text' => "Click me",
    'icon' => null,
    'for' => null,
    'type' => null,
    'disabled' => null
];

return [
    'meta' => [
        'title' => 'button',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/button/',
        'description' => 'Button Description goes here…'
    ],
    'variants' => [
        'button' => array_merge($defaultVariant, []),
        'button--disabled' => array_merge($defaultVariant, [
            'title' => 'Button disabled',
            'status' => 'wip',
            'disabled' => true,
            'modifiers' => ['styleDisabled'],
        ]),
        'button--primary' => array_merge($defaultVariant, [
            'title' => 'Button primary',
            'status' => 'wip',
            'modifiers' => ['stylePrimary'],
        ]),
        'button--secondary' => array_merge($defaultVariant, [
            'title' => 'Button secondary',
            'status' => 'wip',
            'modifiers' => ['styleSecondary'],
        ]),
        'button--withIcon' => array_merge($defaultVariant, [
            'title' => 'Button with icon',
            'icon' => 'iconArrowRight',
            'status' => 'wip',
        ]),
        'button--inline' => array_merge($defaultVariant, [
            'title' => 'Button inline',
            'status' => 'wip',
            'modifiers' => ['styleInline'],
        ]),
    ]
];
