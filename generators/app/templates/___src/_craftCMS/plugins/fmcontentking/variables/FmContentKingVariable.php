<?php
/**
 * FmContentKing plugin for Craft CMS
 *
 * FmContentKing Variable
 *
 * --snip--
 * Craft allows plugins to provide their own template variables, accessible from the {{ craft }} global variable
 * (e.g. {{ craft.pluginName }}).
 *
 * https://craftcms.com/docs/plugins/variables
 * --snip--
 *
 * @author    Daniel Wittberger
 * @copyright Copyright (c) 2017 Daniel Wittberger
 * @link      https://wittistribune.com
 * @package   FmContentKing
 * @since     0.0.1
 */

namespace Craft;

class FmContentKingVariable
{
    /**
     * Whatever you want to output to a Twig template can go into a Variable method. You can have as many variable
     * functions as you want.  From any Twig template, call it like this:
     *
     *     {{ craft.fmContentKing.exampleVariable }}
     *
     * Or, if your variable requires input from Twig:
     *
     *     {{ craft.fmContentKing.exampleVariable(twigValue) }}
     */
    public function getContent($module = false)
    {
        $jsonContent = [];
        $di = new \RecursiveDirectoryIterator(CRAFT_TEMPLATES_PATH, \RecursiveDirectoryIterator::SKIP_DOTS);
        $it = new \RecursiveIteratorIterator($di);

        foreach($it as $file) {
            if (pathinfo($file, PATHINFO_EXTENSION) == "json") {

                $json = file_get_contents($file);
                $dir = pathinfo($file, PATHINFO_DIRNAME);
                $pathArray = explode('/', $dir);
                $fileDir = end($pathArray);

                $jsonContent[$fileDir] = json_decode($json, true);
            }
        }

        if($module) {
            return $jsonContent[$module];
        }

        return $jsonContent;
    }
}
