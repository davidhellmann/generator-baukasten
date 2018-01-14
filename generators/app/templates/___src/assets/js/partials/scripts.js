/**
 * Scripts
 */

import example from '../scripts/example';
import bodyClass from '../scripts/bodyclass';
import disableHover from '../scripts/disableHover';
import browserDetect from '../scripts/bowser';
import '../scripts/lazyloading';
import '../scripts/fontfaceobserver';
// import '../scripts/pagetransition'
// import '../scripts/smoothScroll'
// import '../scripts/waypoints.anime'


// Modules Array
const scriptsArray = [
    example,
    bodyClass,
    disableHover,
    browserDetect
];

const scripts = {
    // Scripts
    Scripts() {
        if (scriptsArray.length > 0 && scriptsArray !== undefined) {
            scriptsArray.forEach((script) => {
                script.init();
            });
        }
    },

    init() {
        this.Scripts();
    }
};

export default scripts;
