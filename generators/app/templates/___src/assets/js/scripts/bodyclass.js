/**
 * bodyClass
 */

const bodyClass = {
    cfg:  {
        body: document.body,
        steps: 500,
        duration: 3000,
        timer: 0,
        i: 1
    },

    setClass() {
        this.cfg.body.classList.add(`is-${this.cfg.i * this.cfg.steps}ms`)
        this.cfg.i += 1
    },

    timer() {
        while (this.cfg.timer <= this.cfg.duration) {
            if (this.cfg.timer === 0) {
                this.cfg.body.classList.add('is-ready')
            } else {
                setTimeout(() => {
                    this.setClass()
                }, this.cfg.timer)
            }
            this.cfg.timer += this.cfg.steps
        }
    },

    init() {
        this.timer()
    }
}

export default bodyClass
