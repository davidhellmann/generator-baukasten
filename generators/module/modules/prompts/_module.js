// Importing message helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsModule = [
    {
        type: 'input',
        name: 'moduleName',
        message: message({
            headline: 'Module Name',
            description: 'Please provide your name:',
            defaultValue: false
        }),
        default: "example",
        validate(input) {
            // Do async stuff
            if (input.indexOf(' ') >= 0) {
                // Pass the return value in the done callback
                return `${chalk.styles.red.open}
No whitespaces allowed!${chalk.styles.red.close}`
            }
            return true
        }
    },
    {
        type: 'checkbox',
        name: "moduleFiles",
        message: "What files do you need?",
        choices: [
            {
                name: 'JavaScript File (main.js)',
                value: 'js',
                checked: true
            }, {
                name: 'Sass File (style.scss)',
                value: 'css',
                checked: true
            }, {
                name: 'Template File (template.html)',
                value: 'template',
                checked: true
            }, {
                name: 'Config File (config.json)',
                value: 'config',
                checked: true
            }]
    },
    {
        when(props) {
            const _isInArray = props.moduleFiles.includes('js')
            return _isInArray
        },
        type: 'input',
        name: 'jsFileName',
        message: message({
            headline: 'JavaScript Filename',
            description: 'Choose a JavaScript File Name or go with the default one:',
            defaultValue: false
        }),
        default: '_main.js',
    },
    {
        when(props) {
            const _isInArray = props.moduleFiles.includes('js')
            return _isInArray
        },
        type: 'input',
        name: 'cssFileName',
        message: message({
            headline: 'CSS Filename',
            description: 'Choose a CSS File Name or go with the default one:',
            defaultValue: false
        }),
        default: '_style.scss',
    },
    {
        when(props) {
            const _isInArray = props.moduleFiles.includes('template')
            return _isInArray
        },
        type: 'input',
        name: 'templateFileName',
        message: message({
            headline: 'Template Filename',
            description: 'Choose a Template File Name or go with the default one:',
            defaultValue: false
        }),
        default: '_template.html',
    },
    {
        when(props) {
            const _isInArray = props.moduleFiles.includes('config')
            return _isInArray
        },
        type: 'input',
        name: 'configFileName',
        message: message({
            headline: 'Config Filename',
            description: 'Choose a Config File Name or go with the default one:',
            defaultValue: false
        }),
        default: '_config.json',
    }
]


module.exports = promptsModule
