/**
 * modules
 */

import preloader from '../../../templates/_atoms/preloader/_script';
import code from '../../../templates/_atoms/code/_script';
import imageSlider from '../../../templates/_organisms/imageSlider/_script';
import imageGallery from '../../../templates/_organisms/imageGallery/_script';

// Modules Array
const modulesArray = [
    preloader,
    code,
    imageSlider,
    imageGallery
];

const modules = {
    // Modules
    Modules() {
        if (modulesArray.length > 0 && modulesArray !== undefined) {
            modulesArray.forEach((module) => {
                module.init();
            });
        }
    },

    init() {
        this.Modules();
    }
};

export default modules;
