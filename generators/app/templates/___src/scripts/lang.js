const memFs = require('mem-fs')
const editor = require('mem-fs-editor')
const inquirer = require('inquirer')
const path = require('path')
const chalk = require('chalk')
const pkg = require('../package.json')
const fs = require('fs')

const langFolder = path.resolve(__dirname, `../${pkg.src.languages.source}`)
let languages = []
let countries = []


const foo = fs.readdirSync(langFolder)
foo.forEach(file => {
    let language = file.split(".")
    language = language[0]

    if (language.includes('_')) {
        countries.push({name: language})
    } else {
        languages.push({name: language})
    }
})

inquirer
    .prompt([
        {
            type: 'checkbox',
            name: 'language',
            message: 'Please select the languages you like create',
            choices: [
                new inquirer.Separator('Languages'),
                ...languages,
                new inquirer.Separator('Countries'),
                ...countries
            ],
            validate: function(answer) {
                if (answer.length < 1) {
                    return 'You must choose at least one language.'
                }
                return true
            }
        },
    ])
    .then(async (answers) => {
        answers.language.forEach((answer) => {
            var store = memFs.create()
            var fs = editor.create(store)

            const srcPath = path.resolve(pkg.src.languages.base)
            const htaccess = pkg.src.languages.htaccess
            const humans = pkg.src.languages.humans
            const index = pkg.src.languages.index
            const robots = pkg.src.languages.robots

            try {
                fs.copy(path.resolve(__dirname, `../scripts/lang/${htaccess}`), `${srcPath}/${answer}/${htaccess}`)
                fs.copyTpl(path.resolve(__dirname, `../scripts/lang/${humans}`), `${srcPath}/${answer}/${humans}`, {
                    authorName: pkg.authors[0].name,
                    authorEmail: pkg.authors[0].email,
                    authorHomepage: pkg.authors[0].homepage,
                    language: answer,
                    projectType: pkg.projectType,
                })

                fs.copyTpl(path.resolve(__dirname, `../scripts/lang/${index}`), `${srcPath}/${answer}/${index}`, {
                    language: answer,
                })

                fs.copy(path.resolve(__dirname, `../scripts/lang/${robots}`), `${srcPath}/${answer}/${robots}`)

                /* All Done */
                fs.commit(function() {
                    console.log(chalk`-> Language: {cyan ${answer}} created!`)
                })
            } catch (e) {
                console.error(e)
            }
        })
    })
