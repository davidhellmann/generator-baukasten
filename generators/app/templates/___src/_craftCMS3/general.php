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
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

// $_ENV constants are loaded by craft-multi-environment from .env.php via public/index.php
return array(

    // All environments
    '*' => [
        // Craft defined config settings
        'cacheDuration' => false,
        'defaultSearchTermOptions' => [
            'attribute' => null,
            'exact' => false,
            'exclude' => false,
            'subLeft' => true,
            'subRight' => true,
        ],
        'limitAutoSlugsToAscii' => true,
        'enableCsrfProtection' => true,
        'generateTransformsBeforePageLoad' => true,
        'omitScriptNameInUrls' => true,
        'usePathInfo' => true,
        'securityKey' => getenv('CRAFTENV_SECURITY_KEY'),
        'useProjectConfigFile' => true,

        'siteUrl' => getenv('CRAFTENV_SITE_URL'),
        // Multisite Settings
        // 'siteUrl' => [
        //    'de' => getenv('CRAFTENV_SITE_URL') . 'de/',
        //    'en' => getenv('CRAFTENV_SITE_URL') . 'en/',
        // ],
        // 'useEmailAsUsername' => true,

        // Aliases parsed in sites’ settings, volumes’ settings, and Local volumes’ settings
        'aliases' => [
            '@basePath' => getenv('CRAFTENV_BASE_PATH'),
            '@baseUrl' => getenv('CRAFTENV_BASE_URL'),
        ],
        // Set the environmental variables
        'custom' => [
            'basePath' => getenv('CRAFTENV_BASE_PATH'),
            'baseUrl' => getenv('CRAFTENV_BASE_URL'),
            'rootUrl' => getenv('CRAFTENV_SITE_URL'),
            'craftEnv' => CRAFT_ENVIRONMENT,
        ],

        // Custom Settings
        'userSessionDuration' => 'P1W',
        'rememberedUserSessionDuration' => 'P4W',
        'defaultCpLanguage' => 'en',
        'postCpLoginRedirect' => 'entries',
        'maxUploadFileSize' => 67108864,
        'defaultTemplateExtensions' => [
            'html',
            'twig',
            'rss'
        ]
    ],

    // Live (production) environment
    'live' => [
        'allowUpdates' => false,
        'backupOnUpdate' => false,
        'devMode' => false,
        'enableTemplateCaching' => true,
        'isSystemLive' => true,
        'allowAdminChanges' => false,
        // Aliases parsed in sites’ settings, volumes’ settings, and Local volumes’ settings
        'aliases' => [
        ],
        // Custom site-specific config settings
        'custom' => [
        ]
    ],

    // Staging (pre-production) environment
    'staging' => [
        'allowUpdates' => false,
        'backupOnUpdate' => false,
        'devMode' => true,
        'enableTemplateCaching' => true,
        'isSystemLive' => true,
        'allowAdminChanges' => false,
        // Aliases parsed in sites’ settings, volumes’ settings, and Local volumes’ settings
        'aliases' => [
        ],
        // Custom site-specific config settings
        'custom' => [
        ]
    ],

    // Local (development) environment
    'local' => [
        'allowUpdates' => true,
        'backupOnUpdate' => true,
        'devMode' => true,
        'enableTemplateCaching' => false,
        'isSystemLive' => true,
        // Aliases parsed in sites’ settings, volumes’ settings, and Local volumes’ settings
        'aliases' => [
        ],
        // Custom site-specific config settings
        'custom' => [
        ]
    ],
);
