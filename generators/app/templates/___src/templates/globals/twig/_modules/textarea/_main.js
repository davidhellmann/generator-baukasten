/**
 * textarea
 */

const textarea = {
    cfg:  {
        name: `textarea`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default textarea
