<?php
class LocalValetDriver extends ValetDriver
{
    /**
     * Determine if the driver serves the request.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return bool
     */
    public function serves($sitePath, $siteName, $uri)
    {
        return is_dir($sitePath . '/vendor/craftcms/cms') && file_exists($sitePath . '/web/index.php');
    }
    /**
     * Determine if the incoming request is for a static file.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return string|false
     */
    public function isStaticFile($sitePath, $siteName, $uri)
    {
        $staticFilePath = $sitePath . '/web/' . $uri;

        if ($this->isActualFile($staticFilePath)) {
            return $staticFilePath;
        }
        return false;
    }


    /**
     * Determine the name of the directory where the front controller lives.
     *
     * @param  string  $sitePath
     * @return string
     */
    public function frontControllerDirectory($sitePath)
    {
        $dirs = ['web', 'public'];
        foreach ($dirs as $dir) {
            if (is_dir($sitePath.'/'.$dir)) {
                return $dir;
            }
        }
        // Give up, and just return the default
        return is_file($sitePath.'/craft') ? 'web' : 'public';
    }

    /**
     * Get the fully resolved path to the application's front controller.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return string
     */
    public function frontControllerPath($sitePath, $siteName, $uri)
    {
        $frontControllerDirectory = $this->frontControllerDirectory($sitePath);
        // Default index path
        $indexPath = $sitePath.'/'.$frontControllerDirectory.'/index.php';
        $scriptName = '/index.php';

        /*
         * Just needed when u need Subfolders
         *
        // Check if the first URL segment matches any of the defined locales
        $locales = [
            'at',
            'de',
            'de_en',
        ];
        $parts = explode('/', $uri);
        if (count($parts) > 1 && in_array($parts[1], $locales)) {
            $indexPath = $sitePath.'/'.$frontControllerDirectory.'/'.$parts[1].'/index.php';
            $scriptName = '/'.$parts[1].'/index.php';
        } */
        $_SERVER['SCRIPT_FILENAME'] = $indexPath;
        $_SERVER['SERVER_NAME'] = $_SERVER['HTTP_HOST'];
        $_SERVER['SCRIPT_NAME'] = $scriptName;
        $_SERVER['PHP_SELF'] = $scriptName;
        $_SERVER['DOCUMENT_ROOT'] = $sitePath.'/'.$frontControllerDirectory;

        return $indexPath;
    }
}
