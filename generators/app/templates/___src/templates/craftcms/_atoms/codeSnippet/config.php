<?php
$defaultVariant = [
    'title' => 'codeSnippet',
    'status' => 'wip',
    'description' => 'codeSnippet Description goes here…',
    'cn' => 'a-codeSnippet',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'text' => 'codeSnippet lorem ipsum dolor sit amet…',
    'open' => true,
    'textShow' => 'Expand Code Block',
    'textHide' => 'Collapse Code Block',
    'snippet' => '<div class="foo">Foo Bar</div>',
    'language' => 'html'
];


return [
    'meta' => [
        'title' => 'codeSnippet',
        'status' => 'none',
        'visible' => true,
        'type' => 'atom',
        'path' => 'atoms/codeSnippet',
        'description' => 'codeSnippet Description goes here…'
    ],
    'variants' => [
        'codeSnippet' => array_merge($defaultVariant, []),
        /*
        'codeSnippet--variant' => array_merge($defaultVariant, [
            'title' => 'codeSnippet Intro',
            'status' => 'wip',
            'description' => 'codeSnippet Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
