/**
 * mainAside
 */

const mainAside = {
    cfg:  {
        name: `mainAside`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default mainAside
