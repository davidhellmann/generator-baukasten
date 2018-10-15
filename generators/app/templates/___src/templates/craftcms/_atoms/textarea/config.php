<?php
$defaultVariant = [
    'title' => 'Textarea default',
    'status' => 'wip',
    'description' => 'textarea Description goes here…',
    'cn' => 'a-textarea',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'name' => 'sample',
    'maxlength' => null,
    'autofocus' => null,
    'readonly' => null,
    'required' => true,
    'disabled' => null,
    'info' => 'Please write in a correct email address.',
    'label' => 'Sample label',
    'id' => null,
    'placeholder' => null
];

return [
    'meta' => [
        'title' => 'textarea',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => '_atoms/textarea/',
        'description' => 'textarea Description goes here…'
    ],
    'variants' => [
        'textarea--default' => array_merge($defaultVariant, []),
        'textarea--disabled' => array_merge($defaultVariant, [
            'title' => 'Textarea disabled',
            'status' => 'wip',
            'disabled' =>  true,
            'modifiers' => ['styleDisabled'],
        ]),
    ]
];
