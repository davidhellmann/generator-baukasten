/**
 * contentSection
 */

const contentSection = {
    cfg:  {
        name: `contentSection`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default contentSection
