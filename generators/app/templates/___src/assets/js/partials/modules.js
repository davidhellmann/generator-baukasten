/**
 * modules
 */

import preloader from '../../../templates/_atoms/preloader/_script';
import codeSnippet from '../../../templates/_atoms/codeSnippet/_script';
import imageSlider from '../../../templates/_organisms/imageSlider/_script';
import imageGallery from '../../../templates/_organisms/imageGallery/_script';
import input from '../../../templates/_atoms/input/_script';
import textarea from '../../../templates/_atoms/textarea/_script';
import accordion    from '../../../templates/_embeds/accordion/_script';
// import cookiebar    from '../../../templates/_modules/cookiebar/_main'
// import imageSlider  from '../../../templates/_modules/imageSlider/_main'
// import imageGallery from '../../../templates/_modules/imageGallery/_main'
// import navCategories from '../../../templates/_modules/navCategories/_main'

// Modules Array
const modulesArray = [
    preloader,
    codeSnippet,
    imageSlider,
    imageGallery,
    input,
    textarea,
    accordion,
    // cookiebar,
    // imageGallery,
    // navCategories
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
