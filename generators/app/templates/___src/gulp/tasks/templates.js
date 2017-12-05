import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
<% if (projectType === 'prototyping' ) { %>
import twig from 'gulp-twig'
import data from 'gulp-data'
import yargs from 'yargs'
import fs from 'fs'
import path from 'path'
const argv = yargs.argv
import errorHandler from '../lib/errorHandler'
<% } %>
import pkg from '../../package.json'

const $ = gulpLoadPlugins()

<% if (projectType === 'prototyping' ) { %>
// Work with a Single File (global.json
const getDataSingle = function(file) {
    const dataPath = pkg.src.dataFile
    const _fileData = (fs.existsSync(dataPath)) ? JSON.parse(fs.readFileSync(dataPath, 'utf8')) : {}
    const productionData = argv.env === 'production' ? { build: true } : { build: false }
    return  { ..._fileData, ...productionData }
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
