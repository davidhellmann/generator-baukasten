/*
 * Description of what this file is for
 *
 * @package  craft3
 * @author David Hellmann [david@hellmann.io]
 * quote
 */

const quote = {
    cfg:  {
        name: `quote`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default quote
