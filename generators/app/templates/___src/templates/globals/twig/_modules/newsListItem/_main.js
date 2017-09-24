/**
 * newsListItem
 */

const newsListItem = {
    cfg:  {
        name: `newsListItem`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default newsListItem
