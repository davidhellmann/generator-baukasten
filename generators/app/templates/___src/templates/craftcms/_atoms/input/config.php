<?php
$defaultVariant = [
    'title' => 'Input default',
    'status' => 'wip',
    'description' => 'input Description goes here…',
    'cn' => 'a-input',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'type' => 'email',
    'name' => 'sample',
    'value' => null,
    'min' => null,
    'max' => null,
    'minlength' => null,
    'maxlength' => null,
    'readonly' => null,
    'pattern' => null,
    'required' => true,
    'disabled' => null,
    'step' => null,
    'info' => 'Please write in a correct email address.',
    'label' => 'Sample label',
    'id' => null,
    'placeholder' => null
];

return [
    'meta' => [
        'title' => 'input',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/input/',
        'description' => 'input Description goes here…'
    ],
    'variants' => [
        'input--default' => array_merge($defaultVariant, []),
        'input--disabled' => array_merge($defaultVariant, [
            'title' => 'Input disabled',
            'status' => 'wip',
            'disabled' =>  true,
        ])
    ]
];
