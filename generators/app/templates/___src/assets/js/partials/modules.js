/**
 * modules
 */

import accordion    from '../../../templates/_modules/accordion/_main'
import cookiebar    from '../../../templates/_modules/cookiebar/_main'
import imageSlider  from '../../../templates/_modules/imageSlider/_main'
import imageGallery from '../../../templates/_modules/imageGallery/_main'
import preloader from '../../../templates/_modules/preloader/_main'

// Modules Array
const modulesArray = [
    preloader,
    accordion,
    cookiebar,
    imageSlider,
    imageGallery
]

const modules = {
    // Modules
    Modules() {
        if (modulesArray.length > 0 && modulesArray !== undefined) {
            modulesArray.forEach((module) => {
                module.init()
            })
        }
    },

    init() {
        this.Modules()
    }
}

export default modules
