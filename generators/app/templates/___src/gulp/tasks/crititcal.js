import gulp from 'gulp'
import critical from 'critical'
import yargs from 'yargs'
import log from 'fancy-log'
import chalk from 'chalk'
import pkg from '../../package.json'

<% if (projectType === 'craftCMS' || projectType === 'craftCMS3' ) { %>
// Process data in an array synchronously, moving onto the n+1 item only after the nth item callback
function doSynchronousLoop(data, processData, done) {
    if (data.length > 0) {
        const loop = (data, i, processData, done) => {
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

// Process the critical path CSS one at a time
function processCriticalCSS(element, i, callback) {
    const argv = yargs.argv
    const url = argv.url || pkg.urls.critical
    const criticalSrc = `${url}${element.url}`
    const criticalDest = `${element.template}_critical.min.css`
    log(`-> Generating critical CSS: ${chalk.cyan(criticalSrc)} -> ${chalk.magenta(criticalDest)}`)
    critical.generate({
        src: criticalSrc,
        dest: criticalDest,
        inline: false,
        ignore: ['font-face'],
        css: [
            `${pkg.dist.css}app.min.css`,
        ],
        minify: true,
        width: 1440,
        height: 1280
    }).then((output) => {
        console.log(`-> Critical CSS generated!`)
        console.log(output)
    }).error((err) => {
        console.log(`-> Something goes wrong!`)
        console.log(err)
    })
}
<% } %>

// critical css task
const criticalcss = (callback) => {
    <% if (projectType === 'craftCMS' || projectType === 'craftCMS3' ) { %>
        doSynchronousLoop(pkg.criticalCSS, processCriticalCSS, () => {
            // all done
            callback()
        })
    <% } else { %>
        const argv = yargs.argv
        const url = argv.url || pkg.urls.critical
        const criticalSrc = url
        const criticalDest = 'critical.min.css'
        const extension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>

        log(`-> Generating critical CSS: ${chalk.cyan(criticalSrc)} -> ${chalk.magenta(criticalDest)}`)
        critical.generate({
            base: pkg.dist.base,
            src: `index${extension}`,
            dest: criticalDest,
            inline: false,
            ignore: ['font-face'],
            css: [
                `${pkg.dist.css}app.min.css`,
            ],
            minify: true,
            width: 1440,
            height: 1280
        }).then((output) => {
            console.log(`-> Critical CSS generated!`)
            console.log(output)
        }).error((err) => {
            console.log(`-> Something goes wrong!`)
            console.log(err)
        })
    <% } %>
}

gulp.task('create:criticalcss', criticalcss)
module.exports = criticalcss
