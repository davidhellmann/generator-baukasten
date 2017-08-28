/* -------------------------------------------------- */
/*    Accordion Label
 /* -------------------------------------------------- */

/**
 * Accordion
 */

import Velocity from 'velocity-animate'

// Config
const cfg = {
    body: document.body,
    triggers: [...document.querySelectorAll('.js-accordionTrigger')],
    up: 'slideUp',
    down: 'slideDown',
    status: 'is-open'
}

const toggleContent = (event) => {
    event.preventDefault()
    const target = event.currentTarget
    const accContent = target.nextElementSibling

    if (!target.classList.contains(cfg.status)) {
        target.classList.add(cfg.status)
        Velocity(accContent, cfg.down, {
            duration: 250,
            complete() {
                accContent.classList.add('fadeIn')
            },
        }, 'easeOutCubic')
    } else {
        target.classList.remove(cfg.status)
        Velocity(accContent, cfg.up, {
            duration: 125,
            complete() {
                accContent.classList.remove('fadeIn')
            },
        }, 'easeOutCubic')
    }
}

const init = () => {
    cfg.triggers.forEach((trigger) => {
        trigger.addEventListener('click', toggleContent)
    })
}

init()

