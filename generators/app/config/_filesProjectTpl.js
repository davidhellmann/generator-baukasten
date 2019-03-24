module.exports = {
    files: [
        {
            src: '___src/_system/.htaccess',
            dest: '___src/_system/.htaccess'
        },
        {
            src: '___src/scripts/critical.js',
            dest: 'scripts/critical.js'
        },
        {
            src: '___src/scripts/FauxTwigExtension.php',
            dest: 'scripts/FauxTwigExtension.php'
        },
        {
            src: '___src/scripts/setup-db.sh',
            dest: 'scripts/setup-db.sh'
        },
        {
            projectContext: [
                'craftCMS3'
            ],
            src: '___src/_craftCMS3/.env',
            dest: '___dist/.env'
        },
        {
            projectContext: [
                'craftCMS3'
            ],
            src: '___src/_craftCMS3/.env.example',
            dest: '___dist/.env.example'
        }
    ]
}
