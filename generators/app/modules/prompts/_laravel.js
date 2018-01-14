// Importing message & when helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsLaravel = [
    {
        when: when('laravel'),
        type: 'confirm',
        name: 'laravelInstall',
        message: message({
            headline: 'Laravel Installation',
            description: 'Do you want to install Laravel via Composer?'
        }),
        default: true
    }
]

module.exports = promptsLaravel
