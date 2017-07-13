# <%= projectName %>
## Version <%= projectVersion %>

## Runs with Baukasten

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

## Description
<%= projectDescription %>


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
gulp init  // npm run init OR yarn init
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
"start": "gulp init",
"dev": "gulp",
"build": "gulp build",
"clean:dist": "gulp clean:dist",
"clean:templates": "gulp clean:templates",
"clean:images": "gulp clean:images",
"clean:js": "gulp clean:js",
"clean:css": "gulp clean:css",
"copy:fonts": "gulp copy:fonts",
"copy:images": "gulp copy:images",
"copy:svg": "gulp copy:svg",
"copy:svg-single": "gulp copy:svg-single",
"create:svg-sprite": "gulp create:svg-sprite",
"copy:systemFiles": "gulp copy:systemFiles",
"compile:css": "gulp compile:css",
"compile:js": "gulp compile:js",
"compile:templates": "gulp compile:templates",
"create:criticalcss": "gulp create:criticalcss",
"create:favicons": "gulp create:favicons",
"create:inlineJS": "gulp create:inlineJS"
```

```
// Clean Tasks
// Clean the specific folder in the "___dist" dir
gulp clean:templates
gulp clean:css
gulp clean:js
gulp clean:images
```

```
// Main Tasks
// All this are triggered within "gulp init" & "gulp build" task.
// Some of this are triggered within the "gulp" task.
gulp compile:templates
gulp create:inlineJS,
gulp copy:systemFiles
gulp modernizr
gulp compile:js
gulp compile:css
gulp copy:fonts
gulp copy:images
gulp copy:svg-single
gulp create:svg-sprite
```

```
// Minify Tasks
// This task are triggered within the "guld build" task.
gulp minify:js
gulp minify:sass
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
