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
        'backupDbOnUpdate' => false,
        'cpTrigger' => 'admin',
        'defaultCpLanguage' => 'en',
        'maxUploadFileSize' => 67108864,
        'defaultSearchTermOptions' => [
            'attribute' => null,
            'exact' => false,
            'exclude' => false,
            'subLeft' => true,
            'subRight' => true,
        ],

        'defaultTemplateExtensions' => array('html', 'twig', 'rss'),
        
        /*
        'siteUrl' => array(
            'de' => getenv('CRAFTENV_SITE_URL') . 'de/',
            'en' => getenv('CRAFTENV_SITE_URL') . 'en/',
        ),
        */
        'siteUrl' => getenv('CRAFTENV_SITE_URL'),
        'rootUrl' => getenv('CRAFTENV_SITE_URL'),
        'craftEnv' => CRAFT_ENVIRONMENT,

        // Set the environmental variables
        'environmentVariables' => array(
            'baseUrl'  => getenv('CRAFTENV_BASE_URL'),
            'basePath' => getenv('CRAFTENV_BASE_PATH'),
            'uploadUrl' => getenv('CRAFTENV_BASE_URL') . 'uploads/',
            'uploadPath' => getenv('CRAFTENV_BASE_PATH') . 'uploads/',
        ),
    ],

    // Live (production) environment
    'live'  => array(
        'isSystemOn' => true,
        'devMode' => false,
        'enableTemplateCaching' => true,
        'allowAutoUpdates' => false,
    ),

    // Staging (pre-production) environment
    'staging'  => array(
        'isSystemOn' => false,
        'devMode' => false,
        'enableTemplateCaching' => true,
        'allowAutoUpdates' => false,
    ),

    // Local (development) environment
    'local'  => array(
        'isSystemOn' => true,
        'devMode' => true,
        'enableTemplateCaching' => false,
        'allowAutoUpdates' => true,
        'disableDevmodeMinifying' => true,
    ),
);
