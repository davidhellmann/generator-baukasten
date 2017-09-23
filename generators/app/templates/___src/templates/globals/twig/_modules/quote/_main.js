/**
 * quote
 */

const quote = {
    cfg:  {
        name: `quote`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default quote
