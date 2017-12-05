/**
 * home
 */

const home = {
    cfg:  {
        name: `home`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default home
