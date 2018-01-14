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
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default <%= moduleName %>
