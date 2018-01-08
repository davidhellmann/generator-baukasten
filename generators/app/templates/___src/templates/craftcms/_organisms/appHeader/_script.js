/**
 * appHeader
 */

const appHeader = {
    cfg:  {
        name: `appHeader`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default appHeader
