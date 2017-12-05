/**
 * ScrollMonitor
 */

import scrollMonitor from 'scrollmonitor'
// import anime from '../../../../node_modules/animejs/anime'

const scrollMonitorScript = {
    doAnimation(triggers) {
        triggers.forEach((trigger) => {
            const elementWatcher = scrollMonitor.create(trigger)

            elementWatcher.enterViewport(() => {
                const waypoints = trigger.querySelectorAll('[data-waypoint]')

                for (let i = 0; i < waypoints.length; i += 1) {
                    const obj = waypoints[i]
                    const delay = 150 + (100 * i)

                    if (!obj.classList.contains('is-animeted')) {
                        if (obj.classList.contains('is-fadeInUp')) {
                            setTimeout(() => {
                                obj.classList.add('is-animated')
                            }, delay)
                        }
                    }
                }
            })
        })
    },

    init() {
        const triggers = document.querySelectorAll('.js-waypointTrigger')
        if (triggers) {
            this.doAnimation(triggers)
        }
    }
}

export default scrollMonitorScript
