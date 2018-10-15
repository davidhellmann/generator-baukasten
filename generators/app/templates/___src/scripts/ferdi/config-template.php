<?php
$defaultVariant = [
    'title' => '<%= moduleName.replace('-', '_') %>',
    'status' => 'wip',
    'description' => '<%= moduleName.replace('-', '_') %> Description goes here…',
    'cn' => 'a-<%= moduleName.replace('-', '_') %>',
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
        'title' => '<%= moduleName.replace('-', '_') %>',
        'status' => 'none',
        'visible' => true,
        'type' => '<%= pathOptions.key.slice(0, -1) %>',
        'path' => '_<%= pathOptions.key %>/<%= moduleName.replace('-', '_') %>/',
        'description' => '<%= moduleName.replace('-', '_') %> Description goes here…'
    ],
    'variants' => [
        '<%= moduleName.replace('-', '_') %>' => array_merge($defaultVariant, []),
        /*
        '<%= moduleName.replace('-', '_') %>--variant' => array_merge($defaultVariant, [
            'title' => '<%= moduleName.replace('-', '_') %> Intro',
            'status' => 'wip',
            'description' => '<%= moduleName.replace('-', '_') %> Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
