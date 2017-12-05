<?php
/**
 * de Translation File
 * Force an englisch Backend
 */

namespace Craft;

if (craft()->request->isCpRequest())
{
    if (craft()->userSession->isAdmin())
    {
        return (include '../craft/app/translations/en_gb.php');
    }
    else
    {
        $de = (include '../craft/app/translations/de.php');
        $custom = array(
            "News" => "Neuigkeiten",
        );

        return array_merge($de, $custom);
    }
}

return array(
    "News" => "Neuigkeiten",
);
