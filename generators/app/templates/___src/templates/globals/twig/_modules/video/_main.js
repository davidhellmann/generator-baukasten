/**
 * video
 */

const video = {
    cfg:  {
        name: `video`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default video
