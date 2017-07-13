const extend = require('deep-extend')

function addBrowserSyncSettings(files = {}, context) {
    extend(files.pkg, {
        browsersync: {
            openbrowser: false,
            proxy: `http://${context.props.projectProxy}/`
        }
    })
}

module.exports = addBrowserSyncSettings
