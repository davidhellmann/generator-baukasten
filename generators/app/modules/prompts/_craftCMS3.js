// Importing message & when helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsCraftCMS3 = [
    {
        when: when('craftCMS3'),
        type: 'confirm',
        name: 'craftCMS3Install',
        message: message({
            headline: 'Craft CMS 3 Installation',
            description: 'Do you want to install the Craft 3 version via Composer?'
        }),
        default: true
    },
    {
        type: 'input',
        name: 'dbDriver',
        message: message({
            headline: 'Database driver',
            description: 'mysql or pgsql'
        }),
        default: 'mysql'
    },
    {
        type: 'input',
        name: 'dbHost',
        message: message({
            headline: 'Database host',
            description: 'localhost or IP'
        }),
        default: 'localhost'
    },
    {
        type: 'input',
        name: 'dbUser',
        message: message({
            headline: 'Database user',
            description: 'Your database user'
        }),
        default: 'root'
    },
    {
        type: 'input',
        name: 'dbPassword',
        message: message({
            headline: 'Database password',
            description: 'Your database password'
        }),
        default: 'root'
    },
    {
        type: 'input',
        name: 'dbName',
        message: message({
            headline: 'Database name',
            description: 'Your database name'
        }),
        default: 'baukasten_database'
    },
    {
        type: 'input',
        name: 'dbTablePrefix',
        message: message({
            headline: 'Database table prefix',
            description: 'Your database table prefix'
        }),
        default: ''
    },
    {
        type: 'input',
        name: 'dbPort',
        message: message({
            headline: 'Database port',
            description: 'Your database port'
        }),
        default: '3306'
    },
    {
        type: 'confirm',
        name: 'importDB',
        message: message({
            headline: 'Import Baukasten Database (recommended)',
            description: 'Do you like to import the Baukasten Datebase?'
        }),
        default: true
    },
]

module.exports = promptsCraftCMS3
