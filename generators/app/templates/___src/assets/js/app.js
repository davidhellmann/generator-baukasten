/**
 * Bundle Scripts
 */
<% if (projectVue) { %>
const vueElement = document.querySelectorAll('#js-vue')
// Beispiel für Lazy Loading von Chunks
if (vueElement) {
    import('./vue/vueExample')
}
<% } %>

// Polyfills
import 'babel-polyfill'
import 'svgxuse'
import '../../../node_modules/objectFitPolyfill/src/objectFitPolyfill'

// Lib
import './lib/bling'

// CSS Import
import '../css/app.scss'

// Scripts
import './scripts/example'
import './scripts/bodyclass'
import './scripts/lazyloading'
import './scripts/fontfaceobserver'
// import './scripts/pagetransition'
// import './scripts/preloader'
// import './scripts/smoothScroll'
// import './scripts/waypoints.anime'

<% if (projectType !== 'wordpress' ) { %>
// Modules
import '../../templates/_modules/accordion/_main'
import '../../templates/_modules/cookiebar/_main'
import '../../templates/_modules/imageSlider/_main'
import '../../templates/_modules/imageGallery/_main'

// Templates
import '../../templates/_templates/toggleContent/_main'
<% } %>


// Debugging
const _debug = false
window._debug = _debug

if (_debug === true) {
    /* eslint-disable no-console */
    console.log('Debugging is: true')
    /* eslint-enable */
    const html = document.getElementsByTagName('html')[0]
    html.classList.add('dev', 'debug')
}
