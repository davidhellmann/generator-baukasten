/**
 * svgSprite
 */

const svgSprite = {
    cfg:  {
        name: `svgSprite`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default svgSprite
