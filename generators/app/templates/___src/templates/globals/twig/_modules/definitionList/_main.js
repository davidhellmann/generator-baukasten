/**
 * definitionList
 */

const definitionList = {
    cfg:  {
        name: `definitionList`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default definitionList
