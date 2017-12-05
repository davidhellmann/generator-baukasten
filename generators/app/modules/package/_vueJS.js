const extend = require('deep-extend')

function addVueJS(files = {}) {
    extend(files.pkg, {
        dependencies: {
            'axios': '^0.17.0',
            'vue': '^2.5.3',
            "vue-axios": "^2.0.2",
            'vue-router': '^3.0.0',
            'vuex': '^3.0.0',
            "vuex-router-sync": "^5.0.0"
        }
    })
}

module.exports = addVueJS
