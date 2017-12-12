/*
 * Description of what this file is for
 *
 * @package  <%= projectName %>
<% for (var i=0; i < authors.length; i++) { -%>
 * @author <%= authors[i].name %> [<%= authors[i].email %>]
<% } -%>
 * <%= moduleName.replace('-', '_') %>
 */

const <%= moduleName.replace('-', '_') %> = {
    cfg:  {
        name: `<%= moduleName.replace('-', '_') %>`
    },

    log(msg) {
        console.log(msg)
    },

    init() {
        this.log(`Init: ${this.cfg.name}`)
    }
}

export default <%= moduleName.replace('-', '_') %>
