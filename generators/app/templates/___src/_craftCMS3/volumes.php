<?php
/**
 * Craft 3 Multi-Environment
 * Efficient and flexible multi-environment config for Craft 3 CMS
 *
 * $_ENV constants are loaded by craft3-multi-environment from .env.php via
 * ./web/index.php for web requests, and ./craft for console requests
 *
 * @author    nystudio107
 * @copyright Copyright (c) 2017 nystudio107
 * @link      https://nystudio107.com/
 * @package   craft3-multi-environment
 * @since     1.0.5
 * @license   MIT
 */
/**
 * Asset Volume Configuration
 *
 * All of your system's volume configuration settings go in here.
 * Put the Asset Volume handle in `ASSET_HANDLE` key, and put the path
 * to the asset directory in `ASSET_PATH`. Create an array for each Asset
 * Volume your website uses.
 *
 * You must create each Asset Volume in the AdminCP first, and then override
 * the settings here.
 */

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
