/**
 * appContent
 */

const appContent = {
    cfg:  {
        name: `appContent`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default appContent
