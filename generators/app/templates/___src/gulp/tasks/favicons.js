import gulp from 'gulp'
import runSequence from 'run-sequence'

const faviconsTask = (cb) => {
    runSequence(
        [
            'create:favicons'
        ],
        [
            'copy:favicons'
        ],
        cb
    );
}

gulp.task('favicons', faviconsTask)
module.exports = faviconsTask
