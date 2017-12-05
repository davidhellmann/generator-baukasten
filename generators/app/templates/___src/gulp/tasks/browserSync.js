import browserSync from 'browser-sync'
import chalk from 'chalk'
import gulp from 'gulp'
import webpack from 'webpack'
import webpackDevMiddleware from 'webpack-dev-middleware'
import webpackHotMiddleware from 'webpack-hot-middleware'
import webpackSettings from '../../webpack/webpack.config.babel'
import pkg from '../../package.json'

const bundler = webpack(webpackSettings)

const browserSyncTask = () => {
    const inject_folder = <% if (projectType === 'wordpress' ) { %> '_partials/_webpack' <% } else { %> '_partials/webpack' <% } %>
    const fileExtension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>
    const fileName = <% if (projectType === 'wordpress' ) { %> '_webpack' <% } else { %> 'webpack' <% } %>

    // Browser Sync Init
    browserSync.init({
        proxy: {
            target: pkg.browsersync.proxy,
            ws: true
        },
        ghostMode: {
            clicks: true,
            forms: true,
            links: true,
            scroll: true
        },
        logLevel: 'info', // info, debug, warn, silent
        watchTask: true,
        open: pkg.browsersync.openbrowser, // false if you don't want to automatically open the browser
        stream: true,
        middleware: [
            webpackDevMiddleware(bundler, {
                quiet: true,
                path: webpackSettings.output.path,
                publicPath: webpackSettings.output.publicPath,
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
            fn(event, file) {
                console.log(chalk`-> Event: {cyan ${event}}: {magenta ${file}}`)
                if (event === 'change' && file.includes('.css')) {
                    browserSync.reload('*.css')
                }
                if (event === 'change' && (
                        file.includes('.php') ||
                        file.includes('.html') ||
                        file.includes('.twig')) ||
                        file.includes('.json')
                ) {
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
}

gulp.task('browser-sync', browserSyncTask)

module.exports = browserSyncTask
