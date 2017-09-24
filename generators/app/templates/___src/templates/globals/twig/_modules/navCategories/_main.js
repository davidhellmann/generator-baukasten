/**
 * navCategories
 */

import Flickity from 'flickity'

const navCategories = {
    init() {
        window.addEventListener('load', () => {
            setTimeout(() => {
                const sliders = [...document.querySelectorAll('.js-navCategories')]
                if (sliders) {
                    sliders.forEach((slider) => {
                        const _slider = slider.querySelector('.m-navCategories__inner')
                        const flkty = Flickity.data(_slider)
                        flkty.resize()
                        _slider.classList.add('is-visible')
                    })
                }
            }, 20)
        })
    }
}

export default navCategories
