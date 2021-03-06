<?php
/**
 * SEOmatic plugin for Craft CMS 3.x
 *
 * A turnkey SEO implementation for Craft CMS that is comprehensive, powerful,
 * and flexible
 *
 * @link      https://nystudio107.com
 * @copyright Copyright (c) 2017 nystudio107
 */
/**
 * @author    nystudio107
 * @package   Seomatic
 * @since     3.0.0
 */
/**
 * SEOmatic config.php
 *
 * This file exists only as a template for the SEOmatic settings.
 * It does nothing on its own.
 *
 * Don't edit this file, instead copy it to 'craft/config' as 'seomatic.php'
 * and make your changes there to override default settings.
 *
 * Once copied to 'craft/config', this file will be multi-environment aware as
 * well, so you can have different settings groups for each environment, just as
 * you do for 'general.php'
 */
return [


    // All environments
    '*' => [
        // The public-facing name of the plugin
        'pluginName' => 'SEOmatic',
        // The server environment, either `live`, `staging`, or `local`
        'environment' => 'live',
        // If `devMode` is on, prefix the <title> with this string
        'devModeTitlePrefix' => '[devMode] ',
        // The max number of characters in the `<title>` tag
        'maxTitleLength' => 70,
        // The max number of characters in the `<meta name="description">` tag
        'maxDescriptionLength' => 320,
    ],

    // Live (production) environment
    'live'  => [
        'environment' => 'live',
    ],

    // Staging (pre-production) environment
    'staging'  => [
        'environment' => 'staging',
    ],

    // Local (development) environment
    'local'  => [
        'environment' => 'local',
    ],
];
