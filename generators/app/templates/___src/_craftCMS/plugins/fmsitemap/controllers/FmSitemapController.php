<?php namespace Craft;

class FmSitemapController extends BaseController
{
	protected $allowAnonymous = true;
	public $images;

	// Defaults
	public $changefreq = 'weekly';
	public $priority = 0.5;
	public $homePriority = 0.75;
	public $multiLocale = true;

	public function actionIndex()
	{
		$xml = new \SimpleXMLElement('<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" xmlns:xhtml="http://www.w3.org/1999/xhtml" />');

		$entries = craft()->elements->getCriteria(ElementType::Entry);
        $entries->limit = null;

		$excludeList = [];
        $sectionSettings = [];

		if (craft()->config->exists('imagesitemap') && array_key_exists('excludeIds', craft()->config->get('fmSitemap'))) {
			$excludeList = craft()->config->get('fmSitemap')['excludeIds'];
		}

        if (craft()->config->exists('imagesitemap') && array_key_exists('sectionSettings', craft()->config->get('fmSitemap'))) {
		    $sectionSettings = craft()->config->get('fmSitemap')['sectionSettings'];
        }

        if (craft()->config->exists('imagesitemap') && array_key_exists('multiLocale', craft()->config->get('fmSitemap'))) {
            $this->multiLocale = craft()->config->get('fmSitemap')['multiLocale'];
        }

        foreach ($entries as $entry) {
            if($entry->url && $entry->status === 'live' && !in_array($entry->id, $excludeList)) {

                $section = craft()->sections->getSectionById($entry->sectionId);
                $sectionHandle = $section->handle;

                foreach ($entry->getFieldLayout()->getFields() as $fieldLayoutField) {
                    $field = $fieldLayoutField->getField();
                    $value = $entry->getFieldValue($field->handle);

                    if (is_object($value) && isset($value->elementType)) {
                        if (is_a($value->elementType, 'Craft\AssetElementType')) {
                            $this->processAssetField($entry, $field);
                        } elseif (is_a($value->elementType, 'Craft\Neo_BlockElementType')) {
                            $this->processNeoField($entry, $field);
                        }
                    }
                }

                $url = $xml->addChild('url');
                $url->addChild('loc', $entry->url);

                if ($this->images) {
                    foreach ($this->images as $image) {
                        $xmlimage = $url->addChild('image:image', null, 'http://www.google.com/schemas/sitemap-image/1.1');
                        $xmlimage->addChild('image:loc', $image['url'], 'http://www.google.com/schemas/sitemap-image/1.1');
                        $xmlimage->addChild('image:caption', htmlspecialchars($image['caption']), 'http://www.google.com/schemas/sitemap-image/1.1');
                    }
                }

                if(array_key_exists($sectionHandle,$sectionSettings)) {
                    $this->changefreq = $sectionSettings[$sectionHandle]['changefreq'];
                    $this->priority = $sectionSettings[$sectionHandle]['priority'];
                }

                if($this->multiLocale) {
                    $locales = $section->getLocales();

                    foreach ($locales as $locale) {
                        $criteria = craft()->elements->getCriteria(ElementType::Entry);
                        $criteria->locale = $locale->locale;
                        $criteria->id = $entry->id;
                        $alternate = $criteria->find();
                        if(isset($alternate[0])) {
                            $alt = $url->addChild('xhtml:link','', 'http://www.w3.org/1999/xhtml');
                            $alt->addAttribute('rel','alternate');
                            $alt->addAttribute('hreflang', $locale->locale);
                            $alt->addAttribute('href',$alternate[0]->url);
                        }
                    }
                }

                $url->addChild('lastmod', $entry->dateUpdated->format(\DateTime::W3C));
                $url->addChild('changefreq', $this->changefreq);
                $url->addChild('priority', $entry->uri == '__home__' ? $this->homePriority : $this->priority);

                $this->images = false;
            }
        }

		HeaderHelper::setContentTypeByExtension('xml');
		ob_start();
		echo $xml->asXML();
		craft()->end();
	}

	private function processAssetField($entry, $field) {
        $handle = $field->handle;
        $entryfield = $entry->$handle;
        foreach($entryfield as $asset) {
            $this->images[] = [
                'url' => $asset->url,
                'caption' => $asset->title
            ];
        }
    }

    private function processAlternateUrls($entry) {

    }

    private function processNeoField($entry, $field) {
        $handle = $field->handle;
        $entryfield = $entry->$handle;
        foreach($entryfield as $block) {
            $blockfields = $block->getFieldLayout()->getFields();
            if(count($blockfields) > 0) {
                $blockfield = $blockfields[0]->getField();
                $blockvalue = $block->getFieldValue($blockfield->handle);

                if(isset($blockvalue->elementType)) {
                    if (is_a($blockvalue->elementType, 'Craft\AssetElementType')) {
                        foreach ($blockvalue as $asset) {
                            $this->images[] = [
                                'url' => $asset->url,
                                'caption' => $asset->title
                            ];
                        }
                    }
                }
            }
        }
    }
}
