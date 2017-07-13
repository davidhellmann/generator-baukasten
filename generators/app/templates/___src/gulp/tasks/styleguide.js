import gulp from 'gulp'
import runSequence from 'run-sequence'
import del from 'del'
import pkg from '../../package.json'
import rename from 'gulp-rename'

// Clean Modules
gulp.task('sg:cleanModules', (cb) => {
    return del([
        `${pkg.fractal.components.modules}**`, `!${pkg.fractal.components.modules}_preview`
    ], {
        force: true
    }, cb)
})

// Clean CSS
gulp.task('sg:cleanCSS', (cb) => {
    return del([
        `${pkg.fractal.public.css}**/*`
    ], {
        force: true
    }, cb)
})

// Clean Images
gulp.task('sg:cleanImages', (cb) => {
    return del([
        `${pkg.fractal.public.images}**/*.{jpeg,jpg,gif,png,webp,svg,ico}`
    ], {
        force: true
    }, cb)
})

// Clean JS
gulp.task('sg:cleanJS', (cb) => {
    return del([
        `${pkg.fractal.public.js}**/*`
    ], {
        force: true
    }, cb)
})

// Clean Fonts
gulp.task('sg:cleanFonts', (cb) => {
    return del([
        `${pkg.fractal.public.fonts}**/*.{ttf,woff,eof,svg,eot,woff2}`
    ], {
        force: true
    }, cb)
})

// Copy Modules
gulp.task('sg:copyModules', (cb) => {
    return gulp
        .src(`${pkg.src.templates}_modules/**/*.{json,html,twig}`)
        .pipe(rename((path) => {
            // console.log('path', path)
            if (path.extname === '.json' ) {
                path.basename = path.basename
            } else {
                path.basename = path.dirname
            }
        }))
        .pipe(gulp.dest(pkg.fractal.components.modules))
})

// Copy CSS
gulp.task('sg:copyCSS', (cb) => {
    return gulp
        .src(`${pkg.dist.css}**/*.*`)
        .pipe(gulp.dest(pkg.fractal.public.css))
})

// Copy JS
gulp.task('sg:copyJS', (cb) => {
    return gulp
        .src(`${pkg.dist.js}**/*.*`)
        .pipe(gulp.dest(pkg.fractal.public.css))
})

// Copy Images
gulp.task('sg:copyImages', (cb) => {
    return gulp
        .src(`${pkg.dist.images.base}**/*.{jpeg,jpg,gif,png,webp,svg,ico}`)
        .pipe(gulp.dest(pkg.fractal.public.images))
})

// Copy Fonts
gulp.task('sg:copyFonts', (cb) => {
    return gulp
        .src(`${pkg.src.fonts}**/*.{ttf,woff,eof,svg,eot,woff2}`)
        .pipe(gulp.dest(pkg.fractal.public.fonts))
})

const styleguideModules = (cb) => {
    runSequence(
        [
            'sg:cleanModules',
            'sg:cleanCSS',
            'sg:cleanImages',
            'sg:cleanJS',
            'sg:cleanFonts'
        ],
        [
            'sg:copyModules',
            'sg:copyCSS',
            'sg:copyJS',
            'sg:copyImages',
            'sg:copyFonts',
        ],
        cb
    )
}

gulp.task('sg:create', styleguideModules)
module.exports = styleguideModules
