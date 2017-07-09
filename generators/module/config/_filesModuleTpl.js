const filesModuleTpl = (context, destPath) => {
    // Check File Extensions
    if (!context.props.jsFileName.includes('.js')) {
        context.props.jsFileName = context.props.jsFileName + '.js'
    }
    if (!context.props.cssFileName.includes('.scss')) {
        context.props.cssFileName = context.props.cssFileName + '.scss'
    }
    if (!context.props.templateFileName.includes('.html')) {
        context.props.templateFileName = context.props.templateFileName + '.html'
    }
    if (!context.props.configFileName.includes('.json')) {
        context.props.configFileName = context.props.configFileName + '.json'
    }

    return {
        files: [
            {
                src: `___src/example/_main.js`,
                dest: `${destPath}/${context.props.moduleName}/${context.props.jsFileName}`,
                type: 'js'
            },
            {
                src: `___src/example/_style.scss`,
                dest: `${destPath}/${context.props.moduleName}/${context.props.cssFileName}`,
                type: 'css'
            },
            {
                src: `___src/example/_template.html`,
                dest: `${destPath}/${context.props.moduleName}/${context.props.templateFileName}`,
                type: 'template'
            },
            {
                src: `___src/example/config.json`,
                dest: `${destPath}/${context.props.moduleName}/${context.props.templateFileName}`,
                type: 'config'
            }
        ]
    }
}

module.exports = filesModuleTpl
