require('babel-core/register')({
    presets: [['es2015']]
})

const requireDir = require('require-dir')

// Define Global Vars
global.checkChanged = false

requireDir('./gulp/tasks', { recurse: true })
