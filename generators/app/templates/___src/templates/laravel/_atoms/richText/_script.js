/**
 * richText
 */

const richText = {
    cfg:  {
        name: `richText`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default richText
