/**
 * Toogle Content
 */

// Config
const cfg = {
    body: document.body,
    triggers: [...document.querySelectorAll('.js-toggleContent')],
    triggersTop: [...document.querySelectorAll('.js-toggleContent--top')],
    status: 'is-open'
}

const toggleContent = (event) => {
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

    if (!target.classList.contains(cfg.status)) {
        target.classList.add(cfg.status)
        content.style.display = 'block'
        textHolder.innerHTML = textOpen
    } else {
        target.classList.remove(cfg.status)
        textHolder.innerHTML = textclosed
        content.style.display = 'none'
    }
}

const init = () => {
    const mergedTriggers = cfg.triggers.concat(cfg.triggersTop)

    mergedTriggers.forEach((trigger) => {
        trigger.addEventListener('click', toggleContent)
    })
}

init()
