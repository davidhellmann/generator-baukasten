<?php namespace Craft;

class FmSitemapPlugin extends BasePlugin
{
	public function getName()
	{
		return 'Fredmansky Simple Sitemap';
	}

	public function getVersion()
	{
		return '0.0.1';
	}

	public function getDeveloper()
	{
		return 'Fredmansky - Daniel Wittberger';
	}

	public function getDeveloperUrl()
	{
		return 'https://fredmansky.at';
	}

	public function registerSiteRoutes()
	{
		return array(
			'sitemap.xml' => array('action' => 'fmSitemap/index')
		);
	}
}
