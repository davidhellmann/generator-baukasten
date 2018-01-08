/**
 * subline
 */

const subline = {
    cfg:  {
        name: `subline`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default subline
