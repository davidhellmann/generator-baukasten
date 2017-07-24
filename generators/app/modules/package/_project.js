const extend = require('deep-extend')

function addProjectSettings(files = {}, context) {

    // Set BrowserSync Settings
    let proxyURL = false

    if (proxyURL !== false) {
        proxyURL = `http://${context.props.projectProxy}/`
    }

    extend(files.pkg, {
        projectName: context.props.projectName,
        projectDescription: context.props.projectDescription,
        urls: {
            local: proxyURL,
            critical: proxyURL
        },
        projectType: context.props.projectType,
        projectVresion: context.props.projectVersion
    })
}

module.exports = addProjectSettings
