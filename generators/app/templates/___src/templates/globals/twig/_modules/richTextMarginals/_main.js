/**
 * richTextMarginals
 */

const richTextMarginals = {
    cfg:  {
        name: `richTextMarginals`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default richTextMarginals
