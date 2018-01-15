<?php

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
        // Whether "index.php" should be visible in URLs (true, false, "auto")
        'omitScriptNameInUrls' => true,
        'usePathInfo' => true,
        'cacheDuration' => false,
        'generateTransformsBeforePageLoad' => true,
        'requireMatchingUserAgentForSession' => false,
        'userSessionDuration' => 'P1W',
        'rememberedUserSessionDuration' => 'P4W',
        'defaultWeekStartDay' => 1,
        'enableCsrfProtection' => true,
        'cpTrigger' => 'admin',
        'preventUserEnumeration' => 'true',
        'sendPoweredByHeader' => 'false',
        'defaultCpLanguage' => 'en',
        'postCpLoginRedirect' => 'entries',
        'maxUploadFileSize' => 67108864,
        'addTrailingSlashesToUrls' => true,
        'defaultSearchTermOptions' => [
            'attribute' => null,
            'exact' => false,
            'exclude' => false,
            'subLeft' => true,
            'subRight' => true,
        ],
        'craftEnv' => CRAFT_ENVIRONMENT,
        'securityKey' => getenv('CRAFTENV_SECURITY_KEY'),
        'usePathInfo' => true,

        'defaultTemplateExtensions' => array('html', 'twig', 'rss'),

        /*
        'siteUrl' => array(
            'de' => getenv('CRAFTENV_SITE_URL') . 'de/',
            'en' => getenv('CRAFTENV_SITE_URL') . 'en/',
        ),
        */
        'siteUrl' => getenv('CRAFTENV_SITE_URL'),

        // Set the environmental variables
        'custom' => array(
            'basePath' => getenv('CRAFTENV_BASE_PATH'),
            'baseUrl' => getenv('CRAFTENV_BASE_URL'),
            'rootUrl' => getenv('CRAFTENV_SITE_URL'),
        ),
    ],

    // Live (production) environment
    'live'  => array(
        'isSystemOn' => true,
        'devMode' => false,
        'enableTemplateCaching' => true,
        'allowUpdates' => false,
        'backupOnUpdate' => false,
        // Custom site-specific config settings
        'custom' => [
        ]
    ),

    // Staging (pre-production) environment
    'staging'  => array(
        'isSystemOn' => true,
        'devMode' => true,
        'enableTemplateCaching' => true,
        'allowUpdates' => false,
        'backupOnUpdate' => false,
        // Custom site-specific config settings
        'custom' => [
        ]
    ),

    // Local (development) environment
    'local'  => array(
        'isSystemOn' => true,
        'devMode' => true,
        'enableTemplateCaching' => false,
        'allowUpdates' => true,
        'backupOnUpdate' => true,
        'disableDevmodeMinifying' => true,
        // Custom site-specific config settings
        'custom' => [
        ]
    ),
);
