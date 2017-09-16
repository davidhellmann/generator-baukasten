//  --------------------------------------------------------
//  SmoothScroll
//  https://github.com/cferdinandi/smooth-scroll
//  --------------------------------------------------------

import smoothScroll from 'smooth-scroll'

smoothScroll.init({
    // Selector for links (must be a class, ID, data attribute, or element tag)
    selector: '[data-scroll]',

    // Selector for fixed headers (must be a valid CSS selector) [optional]
    selectorHeader: null,

    // Integer. How fast to complete the scroll in milliseconds
    speed: 250,

    // Easing pattern to use
    easing: 'easeInOutCubic',

    // Integer. How far to offset the scrolling anchor location in pixels
    offset: 0,

    // Function to run after scrolling
    callback(anchor, toggle) {}
})

if (window.location.hash) {
    setTimeout(() => {
        // Get the anchor
        const anchor = document.querySelector(window.location.hash)

        // Get the toggle (if one exists)
        const toggle = document.querySelector(`a[href*="${window.location.hash}"]`)

        // Any custom options you want to use would go here
        const options = {}
        smoothScroll.animateScroll(anchor, toggle, options)
    }, 250)
}

