/*
 * Description of what this file is for
 *
 * @package  craft3
 * @author David Hellmann [david@hellmann.io]
 * navMain
 */

const navMain = {
    cfg:  {
        name: 'navMain',
        selectors: {
            navMain: 'm-navMain',
        },
        classes: {
            active: 'is-active',
            inActive: 'is-inActive',
            hidden: 'is-hidden',
            visible: 'is-visible'
        },
        el: {
            $navMain: undefined
        },
        els: {
            $navMain: undefined
        }
    },

    log(msg) {
        console.log(msg);
    },

    setElements() {
        console.debug('Set Elements…');
        this.cfg.el.$navMain = document.querySelector(this.cfg.selectors.navMain);
    },

    init() {
        console.debug(`Init: ${this.cfg.name}`);
        this.setElements();
    }
};

export default navMain;
