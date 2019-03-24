<?php
return [

    // All environments
    '*' => [
        'siteImages' => [
            'path' => '@basePath/uploads/images/',
            'url' => '@baseUrl/uploads/images/',
        ],
        'siteDownloads' => [
            'path' => '@basePath/uploads/downloads/',
            'url' =>'@baseUrl/uploads/downloads/',
        ],
        'siteGraphics' => [
            'path' => '@basePath/uploads/graphics/',
            'url' => '@baseUrl/uploads/graphics/',
        ],
        'siteUsers' => [
            'path' => '@basePath/uploads/users/',
            'url' =>'@baseUrl/uploads/users/',
        ],
    ],

    // Live (production) environment
    'live'  => [
    ],

    // Staging (pre-production) environment
    'staging'  => [
    ],

    // Local (development) environment
    'local'  => [
    ],
];
