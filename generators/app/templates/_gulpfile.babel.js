require('babel-core/register')({
    presets: [['es2015']]
})

const requireDir = require('require-dir')

// Define Global Vars
global.checkChanged = true

requireDir('./gulp/tasks', { recurse: true })
