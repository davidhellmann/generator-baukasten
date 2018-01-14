// Import some prompt modules
const promptsAuthor = require('./prompts/_author')
const promptsCraftCMS3 = require('./prompts/_craftCMS3')
const promptsLaravel = require('./prompts/_laravel')
const promptsProject = require('./prompts/_project')
const promptsWordPress = require('./prompts/_wordpress')

function prompts() {
    return [
        ...promptsProject,
        ...promptsCraftCMS3,
        ...promptsLaravel,
        ...promptsWordPress,
        ...promptsAuthor
    ]
}

module.exports = prompts
