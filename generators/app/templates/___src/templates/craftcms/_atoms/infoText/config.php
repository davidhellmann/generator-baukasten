<?php
// Describe your component
$componentMeta = [
    'title' => 'infoText',
    'status' => 'none',
    'visible' => true,
    'type' => 'atom',
    'path' => '_atoms/infoText/',
    'description' => 'infoText Description goes here…'
];

// That's your default Variant. When you need just a single
// Variant you can describe it all here.
$defaultVariant = [
    'title' => 'infoText',
    'status' => '',
    'description' => 'infoText Description goes here…',
    'cn' => 'a-infoText',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'text' => 'Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos?',
];

// When you need more as one variant this part is your friend.
// You can add endless variants.
return [
    'meta' => array_merge($componentMeta, []),
    'variants' => [
        'infoText' => array_merge($defaultVariant, []),
        /*
        'infoText--variantName' => array_merge($defaultVariant, [
            'title' => 'infoText Intro',
            'description' => 'infoText Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
