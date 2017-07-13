const extend = require('deep-extend')

function addProjectSettings(files = {}, context) {
    extend(files.pkg, {
        projectName: context.props.projectName,
        projectDescription: context.props.projectDescription,
        urls: {
            local: `http://${context.props.projectProxy}`,
            critical: `http://${context.props.projectProxy}`
        },
        projectType: context.props.projectType,
        projectVresion: context.props.projectVersion
    })
}

module.exports = addProjectSettings
