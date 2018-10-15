import gulp from 'gulp';
import pkg from '../../package.json';

const watchTask = () => {
    // watch templates
    gulp.watch(`${pkg.src.templates}**/*.{php,html,twig,rss,json}`, { interval: 500 }, ['compile:templates']);

    // watch images
    gulp.watch(`${pkg.src.images.bitmap.base}**/*.{png,jpeg,jpg,gif,webp}`, { interval: 500 }, ['copy:images']);

    // watch SVG Stuff
    gulp.watch(`${pkg.src.images.svg.single}**/*`, { interval: 500 }, ['copy:svg-single']);

    gulp.watch(`${pkg.src.images.svg.sprite}**/*`, { interval: 500 }, ['create:svg-sprite']);
}

gulp.task('watch', ['browser-sync'], watchTask);
module.exports = watchTask;
