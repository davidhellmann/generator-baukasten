<?php
/**
 * CMS Speed Up plugin for Craft CMS
 *
 * CMS Speed Up Service
 *
 * --snip--
 * All of your plugin’s business logic should go in services, including saving data, retrieving data, etc. They
 * provide APIs that your controllers, template variables, and other plugins can interact with.
 *
 * https://craftcms.com/docs/plugins/services
 * --snip--
 *
 * @author    Matt Shearing
 * @copyright Copyright (c) 2017 Matt Shearing
 * @link      adigital.agency
 * @package   CMS Speed Up
 * @since     1.0.0
 */

namespace Craft;

class CmsSpeedUpService extends BaseApplicationComponent
{
    /**
     * This function can literally be anything you want, and you can have as many service functions as you want
     *
     * From any other plugin file, call it like this:
     *
     *     craft()->cmsspeedup->copyResources()
     */
    public function copyResources()
    {
	    $src = craft()->path->getAppPath()."resources";
	    $dest = $_SERVER["DOCUMENT_ROOT"]."/".craft()->config->get('cpTrigger')."/resources";
	    $this->recurseRemove($dest);
	    if (!is_dir($_SERVER["DOCUMENT_ROOT"]."/".craft()->config->get('cpTrigger'))) {
		    mkdir($_SERVER["DOCUMENT_ROOT"]."/".craft()->config->get('cpTrigger'));
	    }
	    $this->recurseCopy($src, $dest);
	    return true;
    }
    
    public function recurseCopy($src, $dst) {
	    $dir = opendir($src);
	    @mkdir($dst);
	    while(false !== ($file = readdir($dir))) {
	        if ($file != '.' && $file != '..') {
	            if (is_dir($src.'/'.$file)) {
	                $this->recurseCopy($src.'/'.$file, $dst.'/'.$file);
	            } else {
	                copy($src.'/'.$file, $dst.'/'.$file);
	            }
	        }
	    }
	    closedir($dir);
	}
    
    public function removeResources()
    {
	    $dest = $_SERVER["DOCUMENT_ROOT"]."/".craft()->config->get('cpTrigger')."/resources";
	    $this->recurseRemove($dest);
	    if (is_dir($_SERVER["DOCUMENT_ROOT"]."/".craft()->config->get('cpTrigger'))) {
		    rmdir($_SERVER["DOCUMENT_ROOT"]."/".craft()->config->get('cpTrigger'));
	    }
	    return true;
    }
	
	public function recurseRemove($dir) {
	    if (is_dir($dir)) {
			$objects = scandir($dir);
			foreach ($objects as $object) {
				if ($object != "." && $object != "..") {
					if (filetype($dir."/".$object) == "dir") {
						$this->recurseRemove($dir."/".$object);
					} else {
						unlink($dir."/".$object);
					}
				}
			}
			reset($objects);
			rmdir($dir);
		}
	}

}