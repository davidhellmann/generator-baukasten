/**
 * link
 */

const link = {
    cfg:  {
        name: `link`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default link
