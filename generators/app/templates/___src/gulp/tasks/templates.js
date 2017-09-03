import gulp from 'gulp'
import twig from 'gulp-twig'
import gulpLoadPlugins from 'gulp-load-plugins'
<% if (projectType === 'prototyping' ) { %>
import data from 'gulp-data'
import fs from 'fs'
import path from 'path'
<% } %>
import pkg from '../../package.json'
import errorHandler from '../lib/errorHandler'

const $ = gulpLoadPlugins()

<% if (projectType === 'prototyping' ) { %>
// Work with multiple Files
var getDataMultiple = function(file) {
    const _dataFile = pkg.src.dataDir + path.basename(file.path, '.html') + '.json'
    return (fs.existsSync(_dataFile)) ? JSON.parse(fs.readFileSync(_dataFile)) : {}
}

// Work with a Single File (global.json
var getDataSingle = function(file) {
    const dataPath = pkg.src.dataFile
    return (fs.existsSync(dataPath)) ? JSON.parse(fs.readFileSync(dataPath, 'utf8')) : {};
}
<% } %>

const templates = () => {
  <% if (projectType === 'prototyping' ) { %>

      return gulp
        .src(`${pkg.src.templates}**/[^_]*.{html,twig,rss}`)
        .pipe(data(getDataSingle()))
        .pipe($.plumber())
        .pipe(twig())
        .on('error', errorHandler)
        .pipe(global.checkChanged === true ? $.changed(pkg.dist.markup) : $.util.noop())
        .pipe(gulp.dest(pkg.dist.markup))

  <% } else { %>
    const inject_folder = <% if (projectType === 'wordpress' ) { %> '_partials/_webpack' <% } else { %> '_partials/webpack' <% } %>
    return gulp
        .src([`!${pkg.src.templates}${inject_folder}/**`, `${pkg.src.templates}**/*.*`])
        .pipe(global.checkChanged === true ? $.changed(pkg.dist.markup) : $.util.noop())
        .pipe(gulp.dest(pkg.dist.markup))

  <% } %>
}

gulp.task('compile:templates', templates)
module.exports = templates
