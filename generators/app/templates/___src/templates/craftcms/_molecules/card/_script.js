/*
 * Description of what this file is for
 *
 * @package  craft3
 * @author David Hellmann [david@hellmann.io]
 * card
 */

const card = {
    cfg:  {
        name: 'card'
    },

    log(msg) {
        console.log(msg);
    },

    init() {
        this.log(`Init: ${this.cfg.name}`);
    }
};

export default card;
