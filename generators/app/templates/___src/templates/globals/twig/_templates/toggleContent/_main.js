/**
 * Toogle Content
 */

const ToggleContent = {
    // Config
    cfg: {
        body: document.body,
        triggers: [...document.querySelectorAll('.js-toggleContent')],
        triggersTop: [...document.querySelectorAll('.js-toggleContent--top')],
        status: 'is-open'
    },

    toggleContent(event) {
        event.preventDefault()

        const target = event.currentTarget
        const contentBottom = target.nextElementSibling
        const contentTop = target.previousElementSibling
        const textOpen = target.getAttribute('data-text-open')
        const textclosed = target.getAttribute('data-text-closed')
        const textHolder = target.querySelector('.js-textHolder')

        let content
        if (target.classList.contains('js-toggleContent')) {
            content = contentBottom
        } else {
            content = contentTop
        }

        if (!target.classList.contains(this.cfg.status)) {
            target.classList.add(this.cfg.status)
            content.style.display = 'block'
            textHolder.innerHTML = textOpen
        } else {
            target.classList.remove(this.cfg.status)
            textHolder.innerHTML = textclosed
            content.style.display = 'none'
        }
    },

    init() {
        const mergedTriggers = this.cfg.triggers.concat(this.cfg.triggersTop)
        mergedTriggers.forEach((trigger) => {
            trigger.addEventListener('click', (event) => {
                this.toggleContent(event)
            })
        })
    }
}

export default ToggleContent
