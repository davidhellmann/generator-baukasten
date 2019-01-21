<?php

use craft\elements\Entry;

return function (Entry $entry) {
    // Get Image
    $entryImage = $entry->entryImage->one();
    // Get Image Data
    if ($entryImage) {
        $entryImageSrc = $entryImage->pluginOptimizedImagesLandscape->src();
        $entryImageSrcSet = $entryImage->pluginOptimizedImagesLandscape->srcset();
        $entryImageSrcSetWebP = $entryImage->pluginOptimizedImagesLandscape->srcsetWebP();
        $entryImageDominantColor = $entryImage->pluginOptimizedImagesLandscape->colorPalette[0];
    }

    return [
        'title' => $entry->title,
        'url' => $entry->url,
        'entryId' => $entry->id,
        'entryCustomH1' => $entry->entryCustomH1,
        'entryIntroText' => $entry->entrySummary,
        'entryImage' => [
            'src' => $entryImageSrc ?? null,
            'srcSet' => $entryImageSrcSet ?? null,
            'srcSetWebP' => $entryImageSrcSetWebP ?? null,
            'dominantColor' => $entryImageDominantColor ?? null,
        ]
    ];
};
