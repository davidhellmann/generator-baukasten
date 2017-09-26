/**
 * navCategories
 */

import Swiper from 'swiper'

const navCategories = {
    cfg: {
        slider: '.js-navCategories',
        sliderOptions: {
            speed: 500,
            loop: false,
            grabCursor: true,
            freeMode: true,
            noSwipingClass: 'no-swiping',
        }
    },

    init() {
        const sliders = [...document.querySelectorAll(this.cfg.slider)]
        if (sliders) {
            sliders.forEach((slider) => {
                const mySwiper = Swiper(slider, this.cfg.sliderOptions)
                mySwiper.onResize()

                setTimeout(() => {
                    mySwiper.onResize()
                }, 500)
            })
        }
    }
}

export default navCategories
