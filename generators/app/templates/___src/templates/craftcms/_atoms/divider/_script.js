/**
 * divider
 */

const divider = {
    cfg:  {
        name: `divider`
    },

    log(msg) {
        console.log(msg);
    },

    init() {
        this.log(`Init: ${this.cfg.name}`);
    }
}

export default divider;
