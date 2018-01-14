const deleteFiles = require('../../../helpers/files/_deleteFolderRecursive')

const laravelFolders = {
    DELETE: [
        '___dist/public/css',
        '___dist/public/js',
        '___dist/.env',
    ]
}

const installLaravel = () => {
    return {
        download: (context) => {
            return context.spawnCommandSync('composer',
                [
                    'create-project',
                    'laravel/laravel',
                    '___dist',
                    '--prefer-dist'
                ])
        },

        deleting: (context) => {
            return new Promise((resolve) => {
                // Delete Files Folder we recreate ourself
                deleteFiles({
                    filelist: laravelFolders.DELETE,
                    context
                })

                resolve()
            })
        },

        writing: (context) => {
            return context.spawnCommandSync('composer',
                [
                    'require',
                    '-d',
                    './___dist',
                    'rcrowe/twigbridge'
                ])
        }
    }
}

module.exports = installLaravel
