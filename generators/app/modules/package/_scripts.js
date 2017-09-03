const extend = require('deep-extend')

function addNPMScripts(files = {}, context) {
    let initCommands = 'cross-env NODE_ENV=production gulp init && yarn webpack'
    if (context.props.projectType === 'craftCMS3') {
        initCommands = 'cross-env NODE_ENV=production gulp init && yarn webpack && cd ___dist && composer install'
    }

    extend(files.pkg, {
        scripts: {
            'start': initCommands,
            'dev': 'cross-env NODE_ENV=production gulp build && cross-env NODE_ENV=development gulp',
            'dev:single': 'cross-env NODE_ENV=development gulp',
            'dev:dashboard': 'cross-env NODE_ENV=development webpack-dashboard -p 3002 && cross-env NODE_ENV=development gulp',
            'build': 'cross-env NODE_ENV=production gulp build && yarn webpack',
            'module': 'node scripts/module.js',
            'critical': 'node scripts/critical.js',
            'clean:dist': 'cross-env NODE_ENV=development gulp clean:dist',
            'clean:templates': 'cross-env NODE_ENV=development gulp clean:templates',
            'clean:images': 'cross-env NODE_ENV=development gulp clean:images',
            'clean:js': 'cross-env NODE_ENV=development gulp clean:js',
            'clean:css': 'cross-env NODE_ENV=development gulp clean:css',
            'copy:fonts': 'cross-env NODE_ENV=development gulp copy:fonts',
            'copy:images': 'cross-env NODE_ENV=development gulp copy:images',
            'copy:svg': 'cross-env NODE_ENV=development gulp copy:svg',
            'copy:svg-single': 'cross-env NODE_ENV=development gulp copy:svg-single',
            'create:svg-sprite': 'cross-env NODE_ENV=development gulp create:svg-sprite',
            'copy:systemFiles': 'cross-env NODE_ENV=development gulp copy:systemFiles',
            'compile:templates': 'cross-env NODE_ENV=development gulp compile:templates',
            'create:favicons': 'cross-env NODE_ENV=development gulp create:favicons',
            'create:inlineJS': 'cross-env NODE_ENV=development gulp create:inlineJS',
            'webpack': 'cross-env NODE_ENV=production webpack --hide-modules --config=webpack/webpack.config.babel.js',
            'webpack:analyze': 'webpack-bundle-analyzer webpack/stats.json ___dist/public/assets/'
        }
    })
}

module.exports = addNPMScripts
