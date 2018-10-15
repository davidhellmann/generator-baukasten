import browserSync from 'browser-sync';
import chalk from 'chalk';
import gulp from 'gulp';
import webpack from 'webpack';
import webpackDevMiddleware from 'webpack-dev-middleware';
import webpackHotMiddleware from 'webpack-hot-middleware';
import webpackSettings from '../../webpack/webpack.config.babel';
import pkg from '../../package.json';

const bundler = webpack(webpackSettings);

// Create Custom Port
function port(str, base = 3000) {
    return (
        str
            .split('')
            .map((c, i) => c.charCodeAt(0) + i)
            .reduce((a, c) => a + c, 0) + base
    );
}

const browserSyncTask = () => {
    const inject_folder = <% if (projectType === 'wordpress' ) { %> '_partials/_webpack' <% } else { %> '_partials/webpack' <% } %>
    const fileExtension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>
    const fileName = <% if (projectType === 'wordpress' ) { %> '_webpack' <% } else { %> 'webpack' <% } %>

    // Browser Sync Init
    browserSync.init({
        proxy: {
            target: pkg.browsersync.proxy,
            ws: true,
        },
        port: port(process.env.PWD),
        ghostMode: {
            clicks: true,
            forms: true,
            links: true,
            scroll: true,
        },
        logLevel: 'info', // info, debug, warn, silent
        watchTask: true,
        open: pkg.browsersync.openbrowser, // false if you don't want to automatically open the browser
        stream: true,
        middleware: [
            webpackDevMiddleware(bundler, {
                logLevel: 'silent',
                path: webpackSettings.output.path,
                publicPath: webpackSettings.output.publicPath,
                stats: {
                    colors: true,
                },
            }),
            webpackHotMiddleware(bundler, {
                log: false,
            }),
        ],
        notify: {
            styles: [
                'padding: 10px 20px;',
                'font-family: arial;',
                'line-height: 1',
                'position: fixed;',
                'font-size: 13px;',
                'font-weight: bold',
                'z-index: 9999;',
                'top: inherit',
                'border-radius: 0',
                'left: 0;',
                'bottom: 32px;',
                'color: #fff;',
                'background-color: rgba(255,0,0, .8)',
                'text-transform: uppercase',
            ],
        },
        files: [
            {
                match: [
                    `${pkg.dist.markup}**/*.{html,php,twig,rss}`,
                    `${pkg.dist.css}**/*.{css}`,
                    `${pkg.dist.images.base}**/*.{jpg,jpeg,webp,gif,png,svg,ico}`,
                ],
                fn(event, file) {
                    console.log(chalk`-> Event: {cyan ${event}}: {magenta ${file}}`);
                    if (event === 'change' && file.includes('.css')) {
                        browserSync.reload('*.css');
                    }
                    if (
                        (event === 'change' &&
              (file.includes('.php') || file.includes('.html') || file.includes('.twig'))) ||
            file.includes('.json')
                    ) {
                        browserSync.reload();
                    }
                },
            },
        ],
    });
};

gulp.task('browser-sync', browserSyncTask);

module.exports = browserSyncTask;
