/**
 * templates
 */

// Import Templats
// import toggleContent from '../../../templates/_templates/toggleContent/_main'

// Modules Array
const templatesArray = [
    // toggleContent
]

const templates = {
    // Modules
    Templates() {
        if (templatesArray.length > 0 && templatesArray !== undefined) {
            templatesArray.forEach((template) => {
                template.init()
            })
        }
    },

    init() {
        this.Templates()
    }
}

export default templates
