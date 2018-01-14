/**
 * figure
 */

const figure = {
    cfg:  {
        name: `figure`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default figure
