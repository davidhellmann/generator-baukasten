const memFs = require('mem-fs')
const editor = require('mem-fs-editor')
const inquirer = require('inquirer')
const path = require('path')
const chalk = require('chalk')
const pkg = require('../package.json')

inquirer
    .prompt([
        {
            type: 'input',
            name: 'moduleName',
            message: 'Please input module name',
            default: 'module',
        },
    ])
    .then(async (answers) => {
        var store = memFs.create()
        var fs = editor.create(store)

        const srcPath = path.resolve(pkg.src.modules.base)
        const jsFile = pkg.src.modules.jsFile
        const cssFile = pkg.src.modules.cssFile
        const templateFile = pkg.src.modules.templateFile
        const configFile = pkg.src.modules.configFile

        try {
            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${jsFile}`), `${srcPath}/${answers.moduleName}/${jsFile}`, {
                moduleName: answers.moduleName,
            })

            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${cssFile}`), `${srcPath}/${answers.moduleName}/${cssFile}`, {
                moduleName: answers.moduleName,
            })

            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${templateFile}`), `${srcPath}/${answers.moduleName}/${templateFile}`, {
                moduleName: answers.moduleName,
            })

            fs.copyTpl(path.resolve(__dirname, `../scripts/module/${configFile}`), `${srcPath}/${answers.moduleName}/${configFile}`, {
                moduleName: answers.moduleName,
            })

            /* All Done */
            fs.commit(function() {
                console.log(chalk`-> Modul: {cyan ${answer.moduleName}} created!`)
            })
        } catch(e) {
            console.error(e)
        }
    })
