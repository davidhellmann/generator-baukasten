const extend = require('deep-extend')

function addVueJS(files = {}) {
    extend(files.pkg, {
        devDependencies: {
            'axios': '^0.15.3',
            'vue': '^2.4.2',
            "vue-axios": "^1.2.2",
            'vue-router': '^2.7.0',
            'vuex': '^2.3.1',
            "vuex-router-sync": "^4.1.2"
        }
    })
}

module.exports = addVueJS
