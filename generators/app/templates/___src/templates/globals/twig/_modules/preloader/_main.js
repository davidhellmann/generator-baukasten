/**
 * preloader
 */

const preloader = {
    cfg: {
        body: document.getElementsByTagName('body')[0],
        bar: document.querySelector('.m-preloader'),
        states: {
            loading: 'is-loading',
            interact: 'is-interactive',
            complete: 'is-complete'
        },
        barstates: {
            loading: 'm-preloader--loading',
            complete: 'm-preloader--complete'
        }
    },

    stateLoading() {
        this.cfg.body.classList.add(this.cfg.states.loading)

        // Start Preloader Bar
        this.cfg.bar.classList.add(this.cfg.barstates.loading)
    },

    stateInteractive() {
        this.cfg.body.classList.remove(this.cfg.states.loading)
        this.cfg.body.classList.add(this.cfg.states.interact)
    },

    stateComplete() {
        setTimeout(() => {
            // Change Classes for Preloader Bar
            this.cfg.bar.classList.remove(this.cfg.barstates.loading)
            this.cfg.bar.classList.add(this.cfg.barstates.complete)
        }, 125)


        setTimeout(() => {
            this.cfg.body.classList.remove(this.cfg.states.interact)
            this.cfg.body.classList.add(this.cfg.states.complete)
        }, 500)
    },

    progressLoader() {
        this.stateLoading()
        this.stateInteractive()

        document.onreadystatechange = () => {
            if (document.readyState === 'complete') {
                this.stateComplete()
            }
        }
    },

    init() {
        if (!this.cfg.body.classList.contains('is-livePreview') &&
            document.getElementsByTagName('html')[0].classList.contains('js')) {
            this.progressLoader()
        }
    }
}

export default preloader
