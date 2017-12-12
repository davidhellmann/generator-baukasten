module.exports = {
    files: [
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'wordpress'
            ],
            src: '___src/assets/fonts/',
            dest: '___src/assets/fonts/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'wordpress'
            ],
            src: '___src/assets/images/',
            dest: '___src/assets/images/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3'
            ],
            src: '___src/_imports/',
            dest: '___src/_imports/'
        },
        {
            projectContext: [
                'craftCMS'
            ],
            src: '___src/_craftCMS/public/uploads/',
            dest: '___dist/public/uploads'
        },
        {
            projectContext: [
                'craftCMS'
            ],
            src: '___src/_craftCMS/plugins/',
            dest: '___dist/craft/plugins'
        },
        {
            projectContext: [
                'craftCMS'
            ],
            src: '___src/_craftCMS/translations/',
            dest: '___dist/craft/translations'
        },
        {
            projectContext: [
                'craftCMS3'
            ],
            src: '___src/_craftCMS3/web/uploads/',
            dest: '___dist/web/uploads'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3'
            ],
            src: '___src/scripts/lang/',
            dest: 'scripts/lang/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3'
            ],
            src: '___src/scripts/module/',
            dest: 'scripts/module/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3'
            ],
            src: '___src/scripts/ferdi/',
            dest: 'scripts/ferdi/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'wordpress'
            ],
            src: 'images/',
            dest: 'images/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'wordpress'
            ],
            src: 'docs/',
            dest: 'docs/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3'
            ],
            src: '___src/templates/webpack-craftcms/',
            dest: '___src/templates/_partials/webpack/'
        },
        {
            projectContext: [
                'wordpress'
            ],
            src: '___src/templates/webpack-wordpress/',
            dest: '___src/templates/_partials/_webpack/'
        }
    ]
}
