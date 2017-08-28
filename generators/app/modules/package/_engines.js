const extend = require('deep-extend')

function addEngines(files = {}) {
    extend(files.pkg, {
        engines: {
            node: ">=8.0.0"
        }
    })
}

module.exports = addEngines
