/*
 * Description of what this file is for
 *
 * @package  baukasten
 * @author David Hellmann [davidhellmann.com@gmail.com]
 * imageCover
 */

const imageCover = {
    cfg:  {
        name: `imageCover`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default imageCover
