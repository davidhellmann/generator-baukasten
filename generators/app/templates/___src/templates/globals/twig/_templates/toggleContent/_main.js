/**
 * Toogle Content
 */

import Velocity from 'velocity-animate'

// Config
const cfg = {
    body: document.body,
    triggers: [...document.querySelectorAll('.js-toggleContent')],
    triggersTop: [...document.querySelectorAll('.js-toggleContent--top')],
    up: 'slideUp',
    down: 'slideDown',
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
        Velocity(content, cfg.down, {
            duration: 250,
            complete() {
                content.classList.add('fadeIn')
                textHolder.innerHTML = textOpen
            },
        }, 'easeOutCubic')
    } else {
        target.classList.remove(cfg.status)
        Velocity(content, cfg.up, {
            duration: 125,
            complete() {
                content.classList.remove('fadeIn')
                textHolder.innerHTML = textclosed
            },
        }, 'easeOutCubic')
    }
}

const init = () => {
    const mergedTriggers = cfg.triggers.concat(cfg.triggersTop)

    mergedTriggers.forEach((trigger) => {
        trigger.addEventListener('click', toggleContent)
    })
}

init()
