const chalk = require('chalk')

const logMessage = ({
                        message = 'Logging',
                        color = 'magenta',
                        short = true,
                        sign = '·',
                        count = 95
                    } = {}) => {
    // Stuff from Martin. Finalize this later or never. Unit tests…
    if (process.env.NODE_ENV === 'test') {
        return
    }

    // Set Vars
    const signs = Array(count + 1).join(sign)
    let consoleMessage = ''

    if (short) {
        consoleMessage = chalk`\n{ ${color}.bold [--- ${message} ---]}\n`
    } else {
        consoleMessage = chalk`\n\n { ${color}.bold  ${message}}\n${color}.bold ${signs} }\n`
    }
    if (this.log) {
        return this.log(consoleMessage)
    }
    console.log(consoleMessage) // eslint- disable
}

module.exports = logMessage
