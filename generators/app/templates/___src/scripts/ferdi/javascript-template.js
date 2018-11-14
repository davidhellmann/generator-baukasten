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
        name: '<%= moduleName.replace('-', '_') %>',
        selectors: {
            sample: '.sample',
        },
        classes: {
            active: 'is-active',
            inActive: 'is-inActive',
            hidden: 'is-hidden',
            visible: 'is-visible'
        },
        el: {
            $sample: undefined
        },
        els: {
            $sample: undefined
        }
    },

    log(msg) {
        console.log(msg);
    },

    setElements() {
        console.debug('Set Elements…')
        this.cfg.el.$sample = document.querySelector(this.cfg.selectors.sample);
    },

    init() {
        console.debug(`Init: ${this.cfg.name}`);
        this.setElements();
    }
};

export default <%= moduleName.replace('-', '_') %>;
