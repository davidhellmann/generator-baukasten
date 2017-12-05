const extend = require('deep-extend')

function addJquerySettings(files = {}) {
    extend(files.pkg, {
        dependencies: {
            jquery: '^3.2.1'
        }
    })
}

module.exports = addJquerySettings
