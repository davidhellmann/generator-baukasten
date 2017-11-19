/**
 * templates
 */

// Import Templats

// Modules Array
const templatesArray = [

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
