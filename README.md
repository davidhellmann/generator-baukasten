# Baukasten

[![Build Status](https://travis-ci.org/davidhellmann/generator-baukasten.svg?branch=master)](https://travis-ci.org/davidhellmann/generator-baukasten)
[![bitHound Overall Score](https://www.bithound.io/github/davidhellmann/generator-baukasten/badges/score.svg)](https://www.bithound.io/github/davidhellmann/generator-baukasten)
[![bitHound Code](https://www.bithound.io/github/davidhellmann/generator-baukasten/badges/code.svg)](https://www.bithound.io/github/davidhellmann/generator-baukasten)
[![bitHound Dependencies](https://www.bithound.io/github/davidhellmann/generator-baukasten/badges/dependencies.svg)](https://www.bithound.io/github/davidhellmann/generator-baukasten/master/dependencies/npm)

<img alt="Baukasten" src="https://raw.githubusercontent.com/davidhellmann/generator-baukasten/master/baukasten.png" width="300">

```
   baukasten made with love & help.
   ---------------------------------------
   Author   :   David Hellmann
   Website  :   https://davidhellmann.com
   Github   :   https://github.com/davidhellmann/generator-baukasten
```

## Install baukasten
```
npm i generator-baukasten -g
```

## Start Generator
```
// Go to your project directory and do that
yo baukasten
```

## Intro
It's just a little 'Baukasten' or Boilerplate for your next Craft CMS or Prototyping Project. WordPress is also on Board
but has not the priority as the other ones. Most of the stuff fits for my own requirements and maybe you have the same
you can have a lot of fun with it. Give it a try.

## IMPORTANT NOTE
Actually the WordPress Version has no Focus. Craft CMS + Prototyping have priority! But you can use it, no problem.

Big thanks to [Sascha Fuchs](https://github.com/gisu) and his [Kittn](http://kittn.de/) for a lot of help and inspiration.
Also big thanks to [Martin Herweg](https://github.com/martinherweg) and his [YO Generator](https://www.npmjs.com/package/generator-mh-boilerplate) that help me a lot too.
And last but not least thanks to all members from our Slack Channel [webdevs](http://webdevs.xyz/) — feel free to join us.


## What's inside? A lot! :-)
### This three scenarios are covered by the generator:
- Craft CMS — Up to Date
- Craft CMS Beta 3 — Not for production
- WordPress — No up to date but a good startpoint
- Prototyping (with Twig) — No up to date but a good startpoint

### Settings
You can find this stuff here: `___src/assets/css/_______settings`


### Sass Functions
You can find this stuff here: `___src/assets/css/______tools`


### Sass Mixins
You can find this stuff here: `___src/assets/css/_______settings`


## Install NPM Packages
```
npm install // yarn install
```


## Initialize Project
```
gulp init  // npm run start OR yarn start
```


### Default Task with BrowserSync
```
gulp // npm run dev OR yarn dev
```


### Task for Building
This Task clean the folder, build the stuff from ground up and optimize the images and minifiy JS / CSS files. Ready for live!

```
gulp build // npm run build OR yarn build
```


### Other Tasks
There are some other Tasks there…

```
// NPM RUN / YARN COMMANDS
npm start
npm dev
npm dev:single
npm build
npm module
npm critical
npm clean:dist
npm clean:templates
npm clean:images
npm clean:js
npm clean:css
npm copy:fonts
npm copy:images
npm copy:svg
npm copy:svg-single
npm create:svg-sprite
npm copy:systemFiles
npm compile:templates
npm create:favicons
npm create:inlineJS
npm webpack
npm webpack:analyze
```

```
// Clean Tasks
// Clean the specific folder in the "___dist" dir
npm clean:templates
npm clean:css
npm clean:js
npm clean:images
```

```
// Main Tasks
// All this are triggered within "gulp init" & "gulp build" task.
// Some of this are triggered within the "gulp" task.
npm compile:templates
npm create:inlineJS,
npm copy:systemFiles
npm copy:fonts
npm copy:images
npm copy:svg-single
npm create:svg-sprite
```

```
// Minify Tasks
// This task are triggered within the "guld build" task.
gulp minify:images
```


## Thanks to
- webdevs - for so many things: [Website](http://webdevs.xyz)
- Sascha Fuchs - for help help help: [Website](https://github.com/gisu)
- Martin Herweg - for help help help: [Website](https://github.com/martinherweg)
- CSS Tricks -  for Easing Map: [Website](https://css-tricks.com/snippets/sass/easing-map-get-function/)
- Florian Kutschera - for the Material Design Box Shadows: [Website](https://medium.com/@Florian/freebie-google-material-design-shadow-helper-2a0501295a2d#.f1fz5ac2o)
- Hugo Giraudel & Eduardo Bouças - for include media: [Website](http://include-media.com/)
- @LukyVj - for family.scss: [Website](http://lukyvj.github.io/family.scss/)
- inuitcss - for some snippets and inspiration: [website](https://github.com/inuitcss/inuitcss)
