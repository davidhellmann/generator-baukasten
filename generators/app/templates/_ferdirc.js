const pkg =  require('./package')

const defaults = {
    template: true,
    style: true,
    javascript: true,
    vue: false,
    config: true,
};

module.exports = {
    fileHeader: {
        authors: pkg.authors,
        projectName: pkg.projectName,
    },
    files: {
        template: {
            name: '_template',
            postfix: '',
            extension: 'html',
            description: 'ferdi should create a Template File',
            default: defaults.template,
        },
        style: {
            name: '_style',
            postfix: '',
            extension: 'scss',
            description: 'ferdi should create Stylesheet File',
            default: defaults.style,
        },
        javascript: {
            name: '_script',
            postfix: '',
            extension: 'js',
            description: 'ferdi should create JavaScript File',
            default: defaults.javascript,
        },
        vue: {
            name: 'vue',
            postfix: '',
            extension: 'vue',
            description: 'ferdi should create Vue File',
            default: defaults.vue,
        },
        config: {
            name: 'config',
            postfix: '',
            extension: 'json',
            description: 'ferdi should create Config File',
            default: defaults.config,
        },
    },
    paths: {
        templateBase: 'scripts/ferdi/',
        modulePath: '___src/templates/',
        pathOptions: {
            // the first character of each key works as an alias for the path so you could use `-a` as an alias for atomic
            atoms: '_atoms/',
            molecules: '_molecules/',
            organisms: '_organisms/',
            embeds: '_embeds/',
        },
    },
};

exports.defaults = defaults;
