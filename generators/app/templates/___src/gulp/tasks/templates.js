import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import pkg from '../../package.json';

const $ = gulpLoadPlugins();

const templates = () => {
    const inject_folder = <% if (projectType === 'wordpress' ) { %> '_partials/_webpack' <% } else { %> '_partials/webpack' <% } %>
    return gulp
        .src([`!${pkg.src.templates}${inject_folder}/**`, `${pkg.src.templates}**/*.*`])
        .pipe(global.checkChanged === true ? $.changed(pkg.dist.markup) : $.util.noop())
        .pipe(gulp.dest(pkg.dist.markup));
};

gulp.task('compile:templates', templates);
module.exports = templates;
