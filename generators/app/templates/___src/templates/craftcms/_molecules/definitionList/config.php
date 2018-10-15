<?php
$defaultVariant = [
    'title' => 'DefinitionList',
    'status' => 'wip',
    'description' => 'definitionList Description goes here…',
    'cn' => 'm-definitionList',
    'modifiers' => [],
    'customClasses' => [],
    'data' => [],
    'js' => null,
    'waypoint' => null,
    'waypointAni' => null,
    'items' => [
        array(
            'term' => 'Foo bar',
            'description' => 'Lorem ipsum dolor sit amet, quas appetere qui te, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.'
        ),
        array(
            'term' => 'Foo bar',
            'description' => 'Lorem ipsum dolor sit amet, quas appetere qui te, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.'
        ),
    ],
];

return [
    'meta' => [
        'title' => 'DefinitionList',
        'status' => 'none',
        'visible' => true,
        'type' => 'molecule',
        'path' => '_molecules/definitionList/',
        'description' => 'definitionList Description goes here…'
    ],
    'variants' => [
        'definitionList' => array_merge($defaultVariant, []),
        /*
        'definitionList--variant' => array_merge($defaultVariant, [
            'title' => 'definitionList Intro',
            'status' => 'wip',
            'description' => 'definitionList Description goes here…',
            'modifiers' => ['variant'],
        ]),
        */
    ]
];
