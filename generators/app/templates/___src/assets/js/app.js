/**
 * Bundle Scripts
 */

// Polyfills
import 'babel-polyfill';
import 'svgxuse';
import objectFitImages from 'object-fit-images';

// Import Libs
import './lib/bling';

// CSS Import
import '../css/app.scss';

import './scripts/prism';

// Import Partials
import scripts from './partials/scripts';
import templates from './partials/templates';
import modules from './partials/modules';

const app = {
    init() {
        scripts.init();
        templates.init();
        modules.init();
        objectFitImages();
    }
};

// Init App!
app.init();
