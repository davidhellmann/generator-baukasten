<?php
// Describe your component
$componentMeta = [
    'title' => 'codeSnippet',
    'status' => 'none',
    'visible' => true,
    'type' => 'atom',
    'path' => 'atoms/codeSnippet',
    'description' => 'codeSnippet Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'codeSnippet',
    'status' => '',
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

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'codeSnippet' => array_merge($defaultVariant, []),
        /*
        'codeSnippet--variantName' => array_merge($defaultVariant, [
            'title' => 'codeSnippet Intro',
            'description' => 'codeSnippet Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
