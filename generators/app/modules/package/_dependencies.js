const extend = require('deep-extend')

function addDependencies(files = {}) {
    extend(files.pkg, {
        dependencies: {
            'animejs': '^2.0.0',
            'babel-polyfill': '^6.26.0',
            'baukasten-grid': '^1.0.0',
            'bowser': '^1.8.1',
            'cookieconsent': '^3.0.4',
            'family.scss': '^1.0.4',
            'ferdi': '^0.0.9',
            'flickity': '^2.0.10',
            'fontfaceobserver': '^2.0.9',
            'gsap': '^1.20.3',
            'in-view': '^0.6.1',
            'include-media': '^1.4.4',
            'js-cookie': '^2.2.0',
            'lazysizes': '^4.0.1',
            'lodash': '^4.16.6',
            'macy': '^2.2.0',
            'modularscale-sass': '^3.0.3',
            'normalize.css': '^7.0.0',
            'object-fit-images': '^3.2.3',
            'photoswipe': '^4.1.1',
            'scrollmonitor': '^1.2.4',
            'smooth-scroll': '^12.1.0',
            'svg-injector-2': '^2.1.3',
            'svgxuse': '^1.2.6',
            'velocity-animate': '^1.3.1',
            'waypoints': '^4.0.0'
        }
    })
}

module.exports = addDependencies
