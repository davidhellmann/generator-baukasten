/**
 * input
 */

const input = {
    cfg:  {
        name: `input`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default input
