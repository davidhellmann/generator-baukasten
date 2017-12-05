import gulp from 'gulp'
import runSequence from 'run-sequence'

const defaultTask = (cb) => {
    runSequence(['browser-sync', 'watch'])
}

gulp.task('default', defaultTask)
module.exports = defaultTask
