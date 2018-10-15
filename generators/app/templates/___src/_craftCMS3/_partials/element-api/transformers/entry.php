<?php

use craft\elements\Entry;

return function (Entry $entry) {
    return [
        'title' => $entry->title,
        'url' => $entry->url,
        'entryId' => $entry->id,
    ];
};
