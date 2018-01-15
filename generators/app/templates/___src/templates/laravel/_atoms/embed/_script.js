/**
 * embed
 */

const embed = {
    cfg:  {
        name: `embed`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default embed
