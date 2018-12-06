<?php

use craft\elements\Entry;

$transformer = include __DIR__ . '/transformers/entry.php';

return [
    'elementType' => Entry::class,
    'criteria' => [
        'section' => 'articles',
    ],
    'cache' => \Craft::$app->config->env === 'live',
    'paginate' => true,
    'elementsPerPage' => 3,
    'pageParam' => 'page',
    'transformer' => $transformer,
];
