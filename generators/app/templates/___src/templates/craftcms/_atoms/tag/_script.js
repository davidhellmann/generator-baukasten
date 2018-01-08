/**
 * tag
 */

const tag = {
    cfg:  {
        name: `tag`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default tag
