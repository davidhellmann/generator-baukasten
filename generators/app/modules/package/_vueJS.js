const extend = require('deep-extend')

function addVueJS(files = {}) {
    extend(files.pkg, {
        dependencies: {
            'vue': '^2.5.16',
            'vue-axios': '^2.0.2',
            'vue-router': '^3.0.1',
            'vuex': '^3.0.1',
            'vuex-router-sync': '^5.0.0',
        }
    })
}

module.exports = addVueJS
