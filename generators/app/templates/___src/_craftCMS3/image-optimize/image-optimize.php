<?php
/**
 * ImageOptimize plugin for Craft CMS 3.x
 *
 * Automatically optimize images after they've been transformed
 *
 * @link      https://nystudio107.com
 * @copyright Copyright (c) 2017 nystudio107
 */

/**
 * ImageOptimize config.php
 *
 * This file exists only as a template for the ImageOptimize settings.
 * It does nothing on its own.
 *
 * Don't edit this file, instead copy it to 'craft/config' as
 * 'image-optimize.php' and make your changes there to override default
 * settings.
 *
 * Once copied to 'craft/config', this file will be multi-environment aware as
 * well, so you can have different settings groups for each environment, just
 * as
 * you do for 'general.php'
 */

return [
    '*' => [
        //  What transform method should be used for image transforms?
        'transformMethod' => 'craft',

        // Domain for the Imgix transform service
        // 'imgixDomain' => 'craftcms.imgix.net',

        // API key for the Imgix transform service
        // 'imgixApiKey' => 'UX5lE9voATc4ZY4eFIlvW25xaYTuqvdk',

        // Should image variant be created on Asset save (aka BeforePageLoad)
        'generateTransformsBeforePageLoad' => true,

        // Controls whether a dominant color palette should be created for image variants
        // It takes a bit of time, so if you never plan to use it, you can turn it off
        'createColorPalette' => true,

        // Controls whether SVG placeholder silhouettes should be created for image variants
        // It takes a bit of time, so if you never plan to use them, you can turn it off
        'createPlaceholderSilhouettes' => false,

        // Controls whether retina images are automatically created with reduced quality
        // as per https://www.netvlies.nl/tips-updates/design-interactie/design-interactie/retina-revolution/
        'lowerQualityRetinaImageVariants' => true,

        // Controls whether Optimized Image Variants be created that would be up-scaled
        // to be larger than the original source image
        'allowUpScaledImageVariants' => false,

        // Controls whether images scaled down >= 50% should be automatically sharpened
        'autoSharpenScaledImages' => false,

        // Default aspect ratios
        'defaultAspectRatios' => [
            ['x' => 16, 'y' => 10],
            ['x' => 16, 'y' => 9],
            ['x' => 4, 'y' => 3],
            ['x' => 1, 'y' => 1],
            ['x' => 10, 'y' => 16],
            ['x' => 3, 'y' => 4],
            ['x' => 3, 'y' => 4],
        ],

        // Default image variants
        'defaultVariants' => [
            [
                'width' => 200,
                'useAspectRatio' => false,
                'aspectRatioX' => 16.0,
                'aspectRatioY' => 10.0,
                'retinaSizes' => ['1'],
                'quality' => 82,
                'format' => 'jpg',
            ],
        ],

        // Active image processors
        'activeImageProcessors' => [
            'jpg' => [
                'jpegoptim',
            ],
            'png' => [
                'optipng',
            ],
            'svg' => [
                'svgo',
            ],
            'gif' => [
                'gifsicle',
            ],
        ],

        // Active image variant creators
        'activeImageVariantCreators' => [
            'jpg' => [
                'cwebp',
            ],
            'png' => [
                'cwebp',
            ],
            'gif' => [
                'cwebp',
            ],
        ],

        // Preset image processors
        'imageProcessors' => [
            // jpeg optimizers
            'jpegoptim' => [
                'commandPath' => '/usr/bin/jpegoptim',
                'commandOptions' => '-s',
                'commandOutputFileFlag' => '',
            ],
            'mozjpeg' => [
                'commandPath' => '/usr/bin/mozjpeg',
                'commandOptions' => '-optimize -copy none',
                'commandOutputFileFlag' => '-outfile',
            ],
            'jpegtran' => [
                'commandPath' => '/usr/bin/jpegtran',
                'commandOptions' => '-optimize -copy none',
                'commandOutputFileFlag' => '',
            ],
            // png optimizers
            'optipng' => [
                'commandPath' => '/usr/bin/optipng',
                'commandOptions' => '-o3 -strip all',
                'commandOutputFileFlag' => '',
            ],
            'pngcrush' => [
                'commandPath' => '/usr/bin/pngcrush',
                'commandOptions' => '-brute -ow',
                'commandOutputFileFlag' => '',
            ],
            'pngquant' => [
                'commandPath' => '/usr/bin/pngquant',
                'commandOptions' => '--strip--skip -if-larger',
                'commandOutputFileFlag' => '',
            ],
            // svg optimizers
            'svgo' => [
                'commandPath' => '/usr/bin/svgo',
                'commandOptions' => '',
                'commandOutputFileFlag' => '',
            ],
            // gif optimizers
            'gifsicle' => [
                'commandPath' => '/usr/bin/gifsicle',
                'commandOptions' => '-O3 -k 256',
                'commandOutputFil   eFlag' => '',
            ],
        ],

        'imageVariantCreators' => [
            // webp variant creator
            'cwebp' => [
                'commandPath' => '/usr/bin/cwebp',
                'commandOptions' => '',
                'commandOutputFileFlag' => '-o',
                'commandQualityFlag' => '-q',
                'imageVariantExtension' => 'webp',
            ],
        ],
    ],

    // Live (production) environment
    'live' => [
    ],

    // Staging (pre-production) environment
    'staging' => [
    ],

    // Local (development) environment
    'local' => [
        // Preset image processors
        'imageProcessors' => [
            // jpeg optimizers
            'jpegoptim' => [
                'commandPath' => '/usr/local/bin/jpegoptim',
            ],
            'mozjpeg' => [
                'commandPath' => '/usr/local/bin/mozjpeg',
            ],
            'jpegtran' => [
                'commandPath' => '/usr/local/bin/jpegtran',
            ],
            // png optimizers
            'optipng' => [
                'commandPath' => '/usr/local/bin/optipng',
            ],
            'pngcrush' => [
                'commandPath' => '/usr/local/bin/pngcrush',
            ],
            'pngquant' => [
                'commandPath' => '/usr/local/bin/pngquant',
            ],
            // svg optimizers
            'svgo' => [
                'commandPath' => '/usr/local/bin/svgo',
            ],
            // gif optimizers
            'gifsicle' => [
                'commandPath' => '/usr/local/bin/gifsicle',
            ],
        ],

        'imageVariantCreators' => [
            // webp variant creator
            'cwebp' => [
                'commandPath' => '/usr/local/bin/cwebp',
            ],
        ],
    ],
];
