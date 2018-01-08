/**
 * caption
 */

const caption = {
    cfg:  {
        name: `caption`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default caption
