/**
 * preloader
 */

import bowser from 'bowser'

const browserDetect = {
    cfg:  {
        customOutput: true,
        docHead: document.querySelector('html'),
        version: bowser.version.toLowerCase().replace(' ', '-').split('.', 1)[0],
        name: bowser.name.toLowerCase().replace(' ', '-'),
    },

    detectBrowser() {
        if (this.cfg.customOutput) {
            // Use the switch condition if you want to customize the output
            switch (bowser.name) {
                case 'Microsoft Edge':
                    this.cfg.docHead.classList.add('edge', `edge-${this.cfg.version}`)
                    break

                case 'Internet Explorer':
                    this.cfg.docHead.classList.add('ie', `ie-${this.cfg.version}`)
                    break

                case 'Firefox':
                    this.cfg.docHead.classList.add('firefox', `firefox-${this.cfg.version}`)
                    break

                case 'Safari':
                    this.cfg.docHead.classList.add('safari', `safari-${this.cfg.version}`)
                    break

                case 'Chrome':
                    this.cfg.docHead.classList.add('chrome', `chrome-${this.cfg.version}`)
                    break

                default:
            }

            // Generate Class for Browser with the old CSS Grid Spec
            const oldSpecBrowser = [
                'internet-explorer-10',
                'internet-explorer-11',
                'microsoft-edge-12',
                'microsoft-edge-13',
                'microsoft-edge-14',
                'microsoft-edge-15'
            ]

            if (oldSpecBrowser.includes(`${this.cfg.name}-${this.cfg.version}`)) {
                this.cfg.docHead.classList.add('t-oldies')
            }
        } else {
            // Generate Classes based on Browser and BrowserVersion
            this.cfg.docHead.classList.add(this.cfg.name, `${this.cfg.name}-${this.cfg.version}`)
        }
    },

    init() {
        this.detectBrowser()
    }
}

export default browserDetect
