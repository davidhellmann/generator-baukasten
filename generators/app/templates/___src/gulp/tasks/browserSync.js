import browserSync from 'browser-sync'
import gulp from 'gulp'
import yargs from 'yargs'
import webpack from 'webpack'
import webpackDevMiddleware from 'webpack-dev-middleware'
import webpackHotMiddleware from 'webpack-hot-middleware'
import webpackSettings from '../../webpack/webpack.config.babel'
import pkg from '../../package.json'

const argv = yargs.argv

const bundler = webpack(webpackSettings)

const browserSyncTask = () => {
    const inject_folder = <% if (projectType === 'wordpress' ) { %> '_partials/_webpack' <% } else { %> '_partials/webpack' <% } %>
    const fileExtension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>
    const fileName = <% if (projectType === 'wordpress' ) { %> '_webpack' <% } else { %> 'webpack' <% } %>

    // Build a condition when Proxy is active
    let bsProxy,  bsServer
    const url = argv.url || pkg.browsersync.proxy

    // Condition for Proxy
    if (pkg.browsersync.proxy !== false) {
        bsProxy = url
        bsServer = false
    } else {
        bsProxy = false
        bsServer = {baseDir: pkg.dist.browserSyncDir}
    }

    // Browser Sync Init
    browserSync.init({
        proxy: bsProxy,
        ghostMode: {
            clicks: true,
            forms: true,
            links: true,
            scroll: true
        },
        logLevel: 'info', // info, debug, warn, silent
        watchTask: true,
        open: pkg.browsersync.openbrowser, // false if you don't want to automatically open the browser
        server: bsServer,
        stream: true,
        middleware: [
            webpackDevMiddleware(bundler, {
                quiet: true,
                path: webpackSettings.output.path,
                stats: {
                    colors: true
                }
            }),
            webpackHotMiddleware(bundler, {
                log: () => {
                }
            })
        ],
        notify: {
            styles: [
                'padding: 20px 40px;',
                'font-family: arial;',
                'line-height: 1',
                'position: fixed;',
                'font-size: 16px;',
                'font-weight: bold',
                'z-index: 9999;',
                'top: inherit',
                'border-radius: 0',
                'right: 0;',
                'bottom: 0;',
                'color: #fff;',
                'background-color: rgba(255,0,0, .8)',
                'text-transform: uppercase'
            ]
        },
        files: [{
            match: [<% if (projectType !== 'prototyping' ) { %>
                `!${pkg.dist.markup}${inject_folder}/${fileName}-header${fileExtension}`,
                `!${pkg.dist.markup}${inject_folder}/${fileName}-scripts${fileExtension}`,<% } %>
                `${pkg.dist.markup}**/*.{html,php,twig,rss}`,
                `${pkg.dist.css}**/*.{css}`,
                `${pkg.dist.images.base}**/*.{jpg,jpeg,webp,gif,png,svg,ico}`
            ],
            fn: function(event, file) {
                console.log(`Event ${event}: ${file}`)
                if (event === 'change' && file.includes('.css')) {
                    browserSync.reload('*.css')
                }
                if (event === 'change' && (file.includes('.php') || file.includes('.html') || file.includes('.twig'))) {
                    browserSync.reload()
                }
            }<% if (projectType !== 'prototyping' ) { %>,
            options: {
                ignore: [
                    `${pkg.dist.markup}${inject_folder}/${fileName}-header${fileExtension}`,
                    `${pkg.dist.markup}${inject_folder}/${fileName}-scripts${fileExtension}`
                ]
            }<% } %>
        }]
    })

gulp.task('browser-sync', browserSyncTask)

module.exports = browserSyncTask
