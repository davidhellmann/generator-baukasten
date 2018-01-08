/**
 * section
 */

const section = {
    cfg:  {
        name: `section`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default section
