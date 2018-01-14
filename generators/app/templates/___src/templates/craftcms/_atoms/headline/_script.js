/**
 * headline
 */

const headline = {
    cfg:  {
        name: `headline`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default headline
