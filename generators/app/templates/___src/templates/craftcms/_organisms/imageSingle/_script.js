/*
 * Description of what this file is for
 *
 * @package  baukasten
 * @author David Hellmann [davidhellmann.com@gmail.com]
 * imageSingle
 */

const imageSingle = {
    cfg:  {
        name: `imageSingle`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default imageSingle
