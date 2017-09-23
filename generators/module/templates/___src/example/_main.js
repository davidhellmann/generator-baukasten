/**
 * <%= moduleName %>
 */

const <%= moduleName %> = {
    cfg:  {
        name: `<%= moduleName %>`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        log(`Init: ${this.cfg.name}`)
    }
}

export default <%= moduleName %>
