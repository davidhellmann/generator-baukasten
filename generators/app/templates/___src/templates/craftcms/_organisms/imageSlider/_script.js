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
        window.addEventListener('load', () => {
            const sliders = [...document.querySelectorAll(this.cfg.slider)];
            if (sliders) {
                sliders.forEach((slider) => {
                    const flkty = new Flickity(slider, this.cfg.sliderOptions);
                    flkty.resize();

                    setTimeout(() => {
                        flkty.resize();
                        slider.classList.add('is-ready');
                    }, 1000);
                });
            }
        });
    }
};

export default imageSlider;
