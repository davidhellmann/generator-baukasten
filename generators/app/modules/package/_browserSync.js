const extend = require('deep-extend')

function addBrowserSyncSettings(files = {}, context) {

    // Set BrowserSync Settings
    let openBrowser = true
    let proxyURL = false

    if (proxyURL !== false) {
        openBrowser = true
        proxyURL = `http://${context.props.projectProxy}/`
    }

    extend(files.pkg, {
        browsersync: {
            openbrowser: openBrowser,
            proxy: proxyURL
        }
    })
}

module.exports = addBrowserSyncSettings
