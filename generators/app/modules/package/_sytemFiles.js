const extend = require('deep-extend')

function addSystemFiles(files = {}) {
    extend(files.pkg, {
        files: {
            systemFiles: [
                '___src/_system/.htaccess',
                '___src/_system/humans.txt',
                '___src/_system/robots.txt'
            ]
        }
    })
}

module.exports = addSystemFiles
