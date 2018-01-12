/**
 * Waypoints
 */

// Dependencies
import anime from 'animejs';
import _throttle from 'lodash/throttle';
import '../vendor/waypoints';


//  --------------------------------------------------------
//  Animation
//  --------------------------------------------------------


// Find Blocks with .sm Element
const triggers = document.querySelectorAll('.js-waypointTrigger');

function initWaypoints(els) {
    els.forEach((el) => {
        // New Waypoint
        new Waypoint({
            element: el,
            handler(direction) {
                // console.log('Triggered')
                // console.log(this.element);

                const waypointID = this.element.id;

                // Check if direction down
                if (direction === 'down') {
                    const fadeInUp = (els, delay) => {
                        anime({
                            targets: els,
                            translateY: ['100', '0'],
                            duration: 750,
                            opacity: [0, 1],
                            delay: delay,
                            easing: 'easeOutBack',
                            complete() {
                                els.classList.add('is-animated');
                            }
                        });
                    };

                    // Get all Child Elements with wayPointID
                    const elements = this.element.querySelectorAll(`[data-waypoint-id="${waypointID}"]`);

                    for (let i = 0; i < elements.length; i += i) {
                        const obj = elements[i];
                        const delay = 80 * i;

                        if (!obj.classList.contains('is-animeted')) {
                            if (obj.classList.contains('m-fadeInUp')) {
                                fadeInUp(obj, delay);
                                obj.classList.add('is-animeted');
                            }
                        }
                    }
                }
            },
            offset: '70%'
        });
    });
}

initWaypoints(triggers);

const refreshWaypoints = _throttle(() => {
    Waypoint.refreshAll();
}, 250);

window.addEventListener('resize', refreshWaypoints);
