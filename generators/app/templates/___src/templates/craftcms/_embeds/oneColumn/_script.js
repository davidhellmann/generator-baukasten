/**
 * oneColumn
 */

const oneColumn = {
    cfg:  {
        name: 'oneColumn'
    },

    log(msg) {
        console.log(msg);
    },

    init() {
        this.log(`Init: ${this.cfg.name}`);
    }
};

export default oneColumn;
