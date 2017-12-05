const memFs = require('mem-fs')
const editor = require('mem-fs-editor')
const inquirer = require('inquirer')
const path = require('path')
const chalk = require('chalk')
const pkg = require('../package.json')

inquirer
    .prompt([
        {
            type: 'list',
            name: 'moduleType',
            message: 'Choose the Module Type…',
            choices: [
                {
                    name: 'Atoms',
                    value: 'atoms'
                },
                {
                    name: 'Molecules',
                    value: 'molecules'
                },
                {
                    name: 'Organisms',
                    value: 'organisms'
                },
                {
                    name: 'Templates',
                    value: 'templates'
                },
                {
                    name: 'Modules',
                    value: 'modules'
                },
            ]
        },
        {
            type: 'input',
            name: 'moduleName',
            message: 'Please input module name',
            default: 'module',
        },
    ])
    .then(async (answers) => {
        console.log(answers)
        var store = memFs.create()
        var fs = editor.create(store)

        const srcPath = path.resolve(`${pkg.src.templates}_${answers.moduleType}/`)
        const jsFile = pkg.src.modules.jsFile
        const cssFile = pkg.src.modules.cssFile
        const templateFile = pkg.src.modules.templateFile
        const configFile = pkg.src.modules.configFile


        console.log(srcPath)

        try {
            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${jsFile}`), `${srcPath}/${answers.moduleName}/${jsFile}`, {
                moduleName: answers.moduleName,
                moduleType: answers.moduleType.charAt(0)
            })

            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${cssFile}`), `${srcPath}/${answers.moduleName}/${cssFile}`, {
                moduleName: answers.moduleName,
                moduleType: answers.moduleType.charAt(0)
            })

            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${templateFile}`), `${srcPath}/${answers.moduleName}/${templateFile}`, {
                moduleName: answers.moduleName,
                moduleType: answers.moduleType.charAt(0)
            })

            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${configFile}`), `${srcPath}/${answers.moduleName}/${configFile}`, {
                moduleName: answers.moduleName,
                moduleType: answers.moduleType.charAt(0)
            })

            /* All Done */
            fs.commit(function() {
                console.log(chalk`-> Modul: {cyan ${answers.moduleName}} created!`)
            })
        } catch(e) {
            console.error(e)
        }
    })
