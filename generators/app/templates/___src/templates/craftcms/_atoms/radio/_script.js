/*
 * Description of what this file is for
 *
 * @package  craft3
 * @author David Hellmann [david@hellmann.io]
 * radio
 */

const radio = {
    cfg:  {
        name: 'radio',
        selectors: {
            sample: '.sample',
        },
        classes: {
            active: 'is-active',
            inActive: 'is-inActive',
            hidden: 'is-hidden',
            visible: 'is-visible'
        },
        el: {
            $sample: undefined
        },
        els: {
            $sample: undefined
        }
    },

    log(msg) {
        console.log(msg);
    },

    setElements() {
        console.debug('Set Elements…')
        this.cfg.el.$sample = document.querySelector(this.cfg.selectors.sample);
    },

    init() {
        this.debug(`Init: ${this.cfg.name}`);
        this.setElements();
    }
};

export default radio;
