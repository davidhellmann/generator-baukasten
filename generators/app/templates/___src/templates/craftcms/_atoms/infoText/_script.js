/**
 * infoText
 */

const infoText = {
    cfg:  {
        name: `infoText`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default infoText
