/**
 * resizer
 */

const resizer = {
    cfg: {
        resizer: [...document.querySelectorAll('.js-resizer')]
    },

    /* initDrag(el) {
        const startX = e.clientX;
        const startWidth = parseInt(document.defaultView.getComputedStyle(p).width, 10);
        document.documentElement.addEventListener('mousemove', doDrag, false);
        document.documentElement.addEventListener('mouseup', stopDrag, false);
    }, */

    doDrag(el, width, x) {
        el.style.width = `${(width + x)}px`
    },

    /* nstopDrag(e) {
        document.documentElement.removeEventListener('mousemove', doDrag, false);
        document.documentElement.removeEventListener('mouseup', stopDrag, false);
    }, */

    init() {
        if (this.cfg.resizer) {
            this.cfg.resizer.forEach((item) => {
                const resizerX = item.querySelector('.js-resizeX')
                // resizerX.addEventListener('mousedown', this.initDrag(item), false)

                resizerX.addEventListener('mousedown', (e) => {
                    const startX = e.clientX
                    const startWidth = parseInt(document.defaultView.getComputedStyle(item).width, 10)

                    e.target.addEventListener('mousemove', this.doDrag(item, startWidth, startX), false)
                    // document.documentElement.addEventListener('mouseup', stopDrag, false);
                }, false)
            })
        }
    }
}

export default resizer

