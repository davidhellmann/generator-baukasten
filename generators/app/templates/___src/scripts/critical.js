const path = require('path')
const argv = require('yargs').argv
const critical = require('critical')
const chalk = require('chalk')
const pkg = require('../package.json')

<% if (projectType === 'craftCMS' || projectType === 'craftCMS3' ) { %>
// Process data in an array synchronously, moving onto the n+1 item only after the nth item callback
    const doSynchronousLoop = (data, processData, done) => {
        if (data.length > 0) {
            const loop = (data, i, processData, done) => {
                console.log(data, i, processData, done)
                processData(data[i], i, () => {
                    if (++i < data.length) {
                        loop(data, i, processData, done)
                    } else {
                        done()
                    }
                })
            }
            loop(data, 0, processData, done)
        } else {
            done()
        }
    }

    const createCriticalCSS = (element, i, callback) => {
        const url = argv.url || pkg.urls.critical
        const criticalSrc = `${url}${element.url}`
        const BASE_PATH = path.resolve(__dirname, '..')
        const criticalDest = `${BASE_PATH}/${pkg.dist.markup}${element.template}_critical.min.css`
        console.log(chalk`-> Generating critical CSS: {cyan ${criticalSrc}} -> {magenta ${criticalDest}}`)

        critical.generate({
            src: criticalSrc,
            dest: criticalDest,
            inline: false,
            ignore: ['font-face'],
            minify: true,
            width: 1440,
            height: 1280
        }).then((output) => {
            console.log(chalk`-> Critical CSS generated: {green ${element.template}_critical.min.css}`)
            callback()
        }).error((err) => {
            console.log(chalk`-> Something goes wrong {red ${err}}`)
        })
    }


    doSynchronousLoop(pkg.criticalCSS, createCriticalCSS, () => {
        console.log(chalk`{green Done!}`)
    })

<% } else { %>

// critical css task
    const createCriticalCSS = () => {
        const url = argv.url || pkg.urls.critical
        const extension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>
        const criticalSrc = `${url}index${extension}`
        const BASE_PATH = path.resolve(__dirname, '..')
        const criticalDest = `${BASE_PATH}/${pkg.dist.markup}critical.min.css`

        console.log(`-> Generating critical CSS: ${chalk.cyan(criticalSrc)} -> ${chalk.magenta(criticalDest)}`)
        critical.generate({
            src: criticalSrc,
            dest: criticalDest,
            inline: false,
            ignore: ['font-face'],
            minify: true,
            width: 1440,
            height: 1280
        }).then((output) => {
            console.log(chalk`-> Critical CSS generated: {green ${element.template}_critical.min.css}`)
            console.log(chalk`{yellow ${output}}`)
            callback()
        }).error((err) => {
            console.log(chalk`-> Something goes wrong {red ${err}}`)
        })
    }

    createCriticalCSS()

<% } %>
