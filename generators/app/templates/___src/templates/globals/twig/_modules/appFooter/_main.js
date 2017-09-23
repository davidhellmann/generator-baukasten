/**
 * appFooter
 */

const appFooter = {
    cfg:  {
        name: `appFooter`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default appFooter
