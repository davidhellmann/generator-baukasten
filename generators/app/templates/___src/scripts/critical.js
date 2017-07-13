const path = require('path')
const argv = require('yargs').argv
const critical = require('critical')
const chalk = require('chalk')
const pkg = require('../package.json')

doSynchronousLoop(pkg.criticalCSS, processCriticalCss, () => {
    console.log('Done')
});

function processCriticalCss(element, i, callback) {
    const url = argv.url || pkg.urls.critical
    const criticalSrc = `${url}${element.url}`
    const BASE_PATH = path.resolve(__dirname, '..')
    const criticalDest = `${`${BASE_PATH}/${pkg.dist.markup}${element.template}`}_critical.min.css`
    console.log(`-> Generating critical CSS: ${chalk.cyan(criticalSrc)} -> ${chalk.magenta(criticalDest)}`)

    critical.generate(
        {
            src: criticalSrc,
            dest: criticalDest,
            inline: false,
            ignore: ['font-face'],
            css: [
                pkg.dist.css + 'app.min.css',
            ],
            minify: true,
            height: 1200,
            width: 1200,
        },
        (err, output) => {
            callback();
        },
    );
}

// Process data in an array synchronously, moving onto the n+1 item only after the nth item callback
function doSynchronousLoop(data, processData, done) {
    if (data.length > 0) {
        const loop = (data, i, processData, done) => {
            processData(data[i], i, () => {
                if (++i < data.length) {
                    loop(data, i, processData, done);
                } else {
                    done();
                }
            });
        };
        loop(data, 0, processData, done);
    } else {
        done();
    }
}
