require('@babel/register')({
    presets: [
        [
            '@babel/preset-env',
            {
                targets: {
                    node: '9.0.0'
                }
            }
        ]
    ]
});

const requireDir = require('require-dir');

// Define Global Vars
global.checkChanged = true;

requireDir('./gulp/tasks', { recurse: true });
