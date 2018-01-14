/**
 * appWrapper
 */

const appWrapper = {
    cfg:  {
        name: `appWrapper`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default appWrapper
