import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json';

const $ = gulpLoadPlugins()

const copyFavicons = () => {
    return gulp
        .src(pkg.src.images.bitmap.favicons + 'favicon.ico')
        .pipe(global.checkChanged === true ? $.changed(pkg.dist.base) : $.util.noop())
        .pipe(gulp.dest(pkg.dist.base))
}

gulp.task('copy:favicons', copyFavicons)
module.exports = copyFavicons
