<?php

$result = ['endpoints' => []];

if (\Craft::$app->request->isConsoleRequest) {
    return $result;
}

function loadElementApiEndpoint(string $filename): array
{
    $path = sprintf('%s/_partials/element-api/%s.php', __DIR__, $filename);
    $content = include($path);
    return $content;
}

$endpoints = [
    'articles'
];


foreach ($endpoints as $endpoint) {
    $url = '/api/' . $endpoint . '.json';
    $result['endpoints'][$url] = loadElementApiEndpoint($endpoint);
}

return $result;
