/**
 * svgIcon
 */

const svgIcon = {
    cfg:  {
        name: `svgIcon`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default svgIcon
