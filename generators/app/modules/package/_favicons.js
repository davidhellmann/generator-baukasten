const extend = require('deep-extend')

function addFaviconsSettings(files = {}, context) {
    extend(files.pkg, {
        favicons: {
            appName: context.props.projectName,
            appDescription: context.props.projectDescription,
            version: context.props.projectVersion,
            url: `http://${context.props.projectProxy}/`,
            developerName: context.props.authorName,
            developerURL: context.props.authorHomepage,
            srcImage: '_favicon.png',
            background: '#fff',
            themeColor: '#fff',
            display: 'standalone',
            orientation: 'portrait',
            logging: false,
            online: false,
            preferOnline: false,
            icons: {
                android: {
                    offset: 4,
                    background: '#fff'
                },
                appleIcon: {
                    offset: 4,
                    background: '#fff'
                },
                appleStartup: true,
                coast: {
                    offset: 25
                },
                favicons: true,
                firefox: true,
                opengraph: true,
                twitter: true,
                windows: true,
                yandex: true
            }
        }
    })
}

module.exports = addFaviconsSettings
