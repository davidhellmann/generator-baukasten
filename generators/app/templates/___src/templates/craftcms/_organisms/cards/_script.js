/*
 * Description of what this file is for
 *
 * @package  craft3
 * @author David Hellmann [david@hellmann.io]
 * cards
 */

const cards = {
    cfg:  {
        name: 'cards'
    },

    log(msg) {
        console.log(msg);
    },

    init() {
        this.log(`Init: ${this.cfg.name}`);
    }
};

export default cards;
