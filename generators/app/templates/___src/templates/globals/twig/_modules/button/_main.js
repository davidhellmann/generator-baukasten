/**
 * button
 */

const button = {
    cfg:  {
        name: `button`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default button
