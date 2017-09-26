/**
 * Image Slider
 */

import Swiper from 'swiper'

const imageSlider = {
    cfg: {
        slider: '.js-imageSlider',
        sliderOptions: {
            speed: 500,
            loop: false,
            grabCursor: true,
            noSwipingClass: 'no-swiping',

            // If we need pagination
            pagination: '.swiper-pagination',
            paginationType: 'bullets', //  "bullets", "fraction", "progress" or "custom"
            paginationClickable: true,

            // Arrows
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',

            // Scrollbar Navi
            // scrollbar: '.swiper-scrollbar',

            // Fraction Navi
            /* paginationFractionRender(swiper, currentClassName, totalClassName) {
                return `<span class="${currentClassName}"></span>
                        of <span class="${totalClassName}"></span>`
            }, */

            // Slides Grid
            slidesPerView: 2, // 2.1
            slidesPerGroup: 2,

            // Responive
            breakpoints: {
                // when window width is <= 480px
                480: {
                    slidesPerView: 1, // 1.1
                    slidesPerGroup: 1,
                },
                // when window width is <= 667px
                667: {
                    slidesPerView: 1, // 1.1
                    slidesPerGroup: 1,
                },
                // when window width is <= 1024px
                1024: {
                    slidesPerView: 2, // 2.1
                    slidesPerGroup: 2,
                },
                // when window width is <= 1280px
                1280: {
                    slidesPerView: 2, // 2.1
                    slidesPerGroup: 2,
                },
                // when window width is <= 1680px
                1680: {
                    slidesPerView: 2, // 2.1
                    slidesPerGroup: 2,
                }
            }
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

export default imageSlider
