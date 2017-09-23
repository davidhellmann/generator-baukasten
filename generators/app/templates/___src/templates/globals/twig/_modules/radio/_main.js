/**
 * radio
 */

const radio = {
    cfg:  {
        name: `radio`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default radio
