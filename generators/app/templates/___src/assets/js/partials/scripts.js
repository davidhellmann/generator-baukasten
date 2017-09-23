/**
 * Scripts
 */

import example from '../scripts/example'
import bodyClass from '../scripts/bodyclass'
import '../scripts/lazyloading'
import '../scripts/fontfaceobserver'
// import '../scripts/pagetransition'
// import '../scripts/smoothScroll'
// import '../scripts/waypoints.anime'


// Modules Array
const scriptsArray = [
    example,
    bodyClass
]

const scripts = {
    // Scripts
    Scripts() {
        if (scriptsArray.length > 0 && scriptsArray !== undefined) {
            scriptsArray.forEach((script) => {
                script.init()
            })
        }
    },

    init() {
        this.Scripts()
    }
}

export default scripts
