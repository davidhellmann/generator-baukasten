/**
 * label
 */

const label = {
    cfg:  {
        name: `label`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default label
