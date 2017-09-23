/**
 * imageCover
 */

const imageCover = {
    cfg:  {
        name: `imageCover`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default imageCover
