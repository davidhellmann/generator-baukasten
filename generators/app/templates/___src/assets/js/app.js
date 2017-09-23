/**
 * Bundle Scripts
 */

// Polyfills
import 'babel-polyfill'
import 'svgxuse'
import 'objectFitPolyfill/src/objectFitPolyfill'

// Import Libs
import './lib/bling'

// CSS Import
import '../css/app.scss'

// Import Partials
import scripts from './partials/scripts'
import templates from './partials/templates'
import modules from './partials/modules'
<% if (projectVue) { %>
// Vue Exampleimport
const vueElement = document.querySelector('#js-vue')

// Beispiel für Lazy Loading von Chunks
if (vueElement) {
    import('./vue/vueExample')
}
<% } %>
const app = {
    init() {
        scripts.init()
        templates.init()
        modules.init()
    }
}

// Init App!
app.init()
