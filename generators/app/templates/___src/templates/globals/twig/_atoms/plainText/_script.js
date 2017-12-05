/**
 * plainText
 */

const plainText = {
    cfg:  {
        name: `plainText`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default plainText
