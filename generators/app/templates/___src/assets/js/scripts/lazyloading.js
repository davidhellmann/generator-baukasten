/**
 * Lazy Loading
 */

// Dependencies
import 'lazysizes';
// import '../../../../node_modules/lazysizes/plugins/bgset/ls.bgset'
import '../../../../node_modules/lazysizes/plugins/respimg/ls.respimg';

document.addEventListener('lazyloaded', (e) => {
    const target = e.target.parentNode;
    target.style.backgroundColor = 'transparent';
});

// Settings
window.lazySizesConfig = window.lazySizesConfig || {};
window.lazySizesConfig.expand = 500; // default 360-500
window.lazySizesConfig.expFactor = 1.7; // default: 1.7
