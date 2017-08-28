/**
 * Accordion
 */

// Config
const cfg = {
    body: document.body,
    triggers: [...document.querySelectorAll('.js-accordionTrigger')],
    status: 'is-open'
}

const toggleContent = (event) => {
    event.preventDefault()
    const target = event.currentTarget
    const accContent = target.nextElementSibling

    if (!target.classList.contains(cfg.status)) {
        target.classList.add(cfg.status)
        accContent.style.display = 'block'
    } else {
        target.classList.remove(cfg.status)
        accContent.style.display = 'none'
    }
}

const init = () => {
    cfg.triggers.forEach((trigger) => {
        trigger.addEventListener('click', toggleContent)
    })
}

init()

