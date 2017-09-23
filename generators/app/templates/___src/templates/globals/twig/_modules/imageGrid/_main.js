/**
 * imageGrid
 */

const imageGrid = {
    cfg:  {
        name: `imageGrid`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default imageGrid
