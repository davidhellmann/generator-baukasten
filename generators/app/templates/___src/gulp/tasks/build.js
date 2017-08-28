import gulp from 'gulp'
import runSequence from 'run-sequence'

const buildTask = (cb) => {
    runSequence(
        [
            'clean:templates',
            'clean:css',
            'clean:js',
            'clean:images',
        ],
        [
            'compile:templates',
            'copy:systemFiles',
            'copy:fonts',
            'create:inlineJS',
            'copy:images',
            'copy:svg-single',
            'create:svg-sprite',
        ],
        [
            'minify:images'
        ],
        cb
    );
}

gulp.task('build', buildTask)
module.exports = buildTask
