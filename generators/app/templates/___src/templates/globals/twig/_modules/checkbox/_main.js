/**
 * checkbox
 */

const checkbox = {
    cfg:  {
        name: `checkbox`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default checkbox
