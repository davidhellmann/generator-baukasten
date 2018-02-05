// import FontFaceObserver from 'fontfaceobserver'

// Disable if you use WebFonts
// document.documentElement.className += " wf-loaded"


/**
 * Check if the User already visited the site and the Fonts were loaded
 * If not resolve all fonts, otherwise directly set the class to html
 */
/*
const fontA = new FontFaceObserver('fontA');
const fontB = new FontFaceObserver('fontB');

if (sessionStorage.fontsLoaded === true) {
    console.log('Fonts loaded via cache');
    alert('Fonts loaded via cache');
    document.documentElement.classList.add('wf-loaded');
} else {
    console.log('FontLoaded not in session storage');
    // Add all Variables defined above in the array of Promise.all
    Promise.all([fontA.load(), fontB.load()])
        .then(function() {
            console.log('Fonts loaded');
            document.documentElement.classList.add('wf-loaded');
            sessionStorage.fontsLoaded = true;
        })
        .catch((e) => {
            console.error(e);
            document.documentElement.classList.add('wf-failed');
            sessionStorage.fontsLoaded = false;
        });
}
*/


/**
 * Single Font Example
 fontA.load().then(function () {
    console.log('Fonts loaded');
    document.documentElement.classList.add('wf-loaded');
    sessionStorage.fontsLoaded = true;
}).catch(function () {
    console.error(e);
    document.documentElement.classList.add('wf-failed');
    sessionStorage.fontsLoaded = false;
});
 */
