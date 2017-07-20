/**
 * Bundle Scripts
 */
<% if (projectVue) { %>
// Vue Stuff
// import './vue/vueExample'
<% } %>

// Polyfills
import 'babel-polyfill'
import 'svgxuse'

// Lib
import './lib/bling'

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
    console.log('Debugging is: true')
    const html = document.getElementsByTagName('html')[0]
    html.classList.add('dev', 'debug')
}

