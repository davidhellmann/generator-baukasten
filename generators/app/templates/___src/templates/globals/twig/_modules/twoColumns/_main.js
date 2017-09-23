/**
 * twoColumns
 */

const twoColumns = {
    cfg:  {
        name: `twoColumns`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default twoColumns
