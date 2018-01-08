/*
 * Description of what this file is for
 *
 * @package  baukasten
 * @author David Hellmann [davidhellmann.com@gmail.com]
 * contactForm
 */

const contactForm = {
    cfg:  {
        name: `contactForm`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default contactForm
