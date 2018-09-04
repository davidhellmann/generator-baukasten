const extend = require('deep-extend')

function addNPMScripts(files = {}, context) {
    let initCommands = 'cross-env NODE_ENV=production gulp init && npm run webpack'
    if (context.props.projectType === 'craftCMS3') {
        initCommands = 'cross-env NODE_ENV=production gulp init && npm run webpack && cd ___dist && mkdir -p storage && composer install --no-interaction --prefer-dist --optimize-autoloader'
    }

    extend(files.pkg, {
        scripts: {
            'start': initCommands,
            'dev': 'cross-env NODE_ENV=production gulp build && cross-env NODE_ENV=development gulp',
            'dev:single': 'cross-env NODE_ENV=development gulp',
            'dev:dashboard': 'cross-env NODE_ENV=development webpack-dashboard -p 3002 && cross-env NODE_ENV=development gulp',
            'build': 'cross-env NODE_ENV=production gulp build && npm run webpack',
            'lang': 'node scripts/lang.js',
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
            'create:favicons': 'cross-env NODE_ENV=development gulp favicons',
            'create:inlineJS': 'cross-env NODE_ENV=development gulp create:inlineJS',
            'webpack': 'cross-env NODE_ENV=production webpack --hide-modules --config=webpack/webpack.config.babel.js',
            'webpack:analyze': 'webpack-bundle-analyzer webpack/stats.json ___dist/public/assets/',
            'install:plugins': 'cd ___dist && sh ./plugins.sh',
            'pull:db': './___dist/craft-scripts/pull_db.sh',
            'pull:assets': './___dist/craft-scripts/pull_assets.sh',
            'pull:backups': './___dist/craft-scripts/pull_backups.sh',
            'pull:all': 'npm run pull:db && npm run pull:assets && npm run pull:backups',
            'backup:db': './___dist/craft-scripts/backup_db.sh',
            'backup:assets': './___dist/craft-scripts/backup_assets.sh',
            'backup:all': 'npm run backup:db && npm run backup:assets',
            'clear:caches': './___dist/craft-scripts/clear_caches.sh',
            'install:plugins': 'cd ___dist && sh ./plugins.sh'
        }
    })
}

module.exports = addNPMScripts
