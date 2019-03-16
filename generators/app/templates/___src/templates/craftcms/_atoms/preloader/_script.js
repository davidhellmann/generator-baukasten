/**
 * preloader
 */

const preloader = {
    cfg: {
        body: document.getElementsByTagName('body')[0],
        states: {
            loading: 'is-loading',
            interact: 'is-interactive',
            complete: 'is-complete'
        }
    },

    stateLoading() {
        this.cfg.body.classList.add(this.cfg.states.loading);
    },

    stateInteractive() {
        this.cfg.body.classList.remove(this.cfg.states.loading);
        this.cfg.body.classList.add(this.cfg.states.interact);
    },

    stateComplete() {
        setTimeout(() => {
            this.cfg.body.classList.remove(this.cfg.states.interact);
            this.cfg.body.classList.add(this.cfg.states.complete);
        }, 50);
    },

    progressLoader() {
        this.stateLoading();
        this.stateInteractive();

        document.onreadystatechange = () => {
            if (document.readyState === 'complete') {
                this.stateComplete();
            }
        };
    },

    init() {
        if (!this.cfg.body.classList.contains('is-livePreview') &&
            document.getElementsByTagName('html')[0].classList.contains('js')) {
            this.progressLoader();
        }
    }
};

export default preloader;
