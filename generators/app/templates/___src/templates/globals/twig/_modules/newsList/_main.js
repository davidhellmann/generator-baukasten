/**
 * newsList
 */

const newsList = {
    cfg:  {
        name: `newsList`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default newsList
