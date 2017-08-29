const extend = require('deep-extend')

function addJquerySettings(files = {}) {
    extend(files.pkg, {
        dependencies: {
            jquery: '^3.2.0'
        }
    })
}

module.exports = addJquerySettings
