/**
 * Image Slider
 */

import Flickity from 'flickity';

const imageSlider = {
    cfg: {
        slider: '.js-imageSlider',
        sliderOptions: {
            cellAlign: 'left',
            contain: true,
            draggable: true,
            friction: 1,
            lazyLoad: 2,
            selectedAttraction: 0.1,
            groupCells: true,
            setGallerySize: true,
            imagesLoaded: true,
            prevNextButtons: true,
            pageDots: true,
            wrapAround: false,
            // watchCSS: true

        }
    },

    init() {
        const sliders = [...document.querySelectorAll(this.cfg.slider)];
        if (sliders) {
            sliders.forEach((slider) => {
                const flkty = new Flickity(slider, this.cfg.sliderOptions);
                flkty.resize();

                setTimeout(() => {
                    flkty.resize();
                }, 2000);
                /* const mySwiper = new Swiper(slider, this.cfg.sliderOptions)
                mySwiper.update()

                setTimeout(() => {
                    mySwiper.update()
                }, 2000) */
            });
        }
    }
};

export default imageSlider;
