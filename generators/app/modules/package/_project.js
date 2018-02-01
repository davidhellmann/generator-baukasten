const extend = require('deep-extend')

function addProjectSettings(files = {}, context) {

    // Set BrowserSync Settings
    let proxyURL = false

    if (context.props.projectProxy !== 'false') {
        proxyURL = `http://${context.props.projectProxy}/`
    }

    extend(files.pkg, {
        projectName: context.props.projectName,
        projectDescription: context.props.projectDescription,
        urls: {
            local: proxyURL,
            critical: proxyURL,
            favicons: proxyURL
        },
        projectType: context.props.projectType,
        projectVersion: context.props.projectVersion,
        private: context.props.projectPrivateRepo
    })
}

module.exports = addProjectSettings
