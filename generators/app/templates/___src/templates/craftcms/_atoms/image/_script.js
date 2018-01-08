/**
 * image
 */

const image = {
    cfg:  {
        name: `image`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default image
