/**
 * seperator
 */

const seperator = {
    cfg:  {
        name: `seperator`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default seperator
