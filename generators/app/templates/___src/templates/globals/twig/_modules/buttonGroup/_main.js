/**
 * buttonGroup
 */

const buttonGroup = {
    cfg:  {
        name: `buttonGroup`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default buttonGroup
