![Logo of the project](./images/logo.sample.png)

# <%= projectName %>
> Additional information or tag line. Edit or remove.

## Installing / Getting started
```shell
// Install NPM
npm install npm@latest -g
<% if (projectType === 'craftCMS3' ) { %>
// Install Compser
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer<% } %>
```

Installed NPM Global
<% if (projectType === 'craftCMS3' ) { %>Installed Composer Global<% } %>

## Developing
### Built With
<% if (projectType === 'craftCMS' ) { %>- [Craft CMS](https://craftcms.com/)<% } %>
<% if (projectType === 'craftCMS3' ) { %>- [Craft CMS](https://craftcms.com/)<% } %>
<% if (projectType === 'wordpress' ) { %>- [WordPress](https://wordpress.org/)<% } %>
<% if (projectType === 'prototyping' ) { %>- [Twig](https://twig.symfony.com/)<% } %>

### Requirements
- [NodeJS](https://nodejs.org/en/)
- [NPM](https://www.npmjs.com/) or [YARN](https://yarnpkg.com/lang/en/)
<% if (projectType === 'craftCMS' ) { %>- [PHP](http://php.net/)
- [MySQL](https://www.mysql.com)<% } %>
<% if (projectType === 'craftCMS3' ) { %>- [PHP](http://php.net/)
- [MySQL](https://www.mysql.com)
- [Composer](https://getcomposer.org/)<% } %>
<% if (projectType === 'wordpress' ) { %>- [PHP](http://php.net/)
- [MySQL](https://www.mysql.com)<% } %>

### Setting up Dev Environment
```shell
git clone https://github.com/your/your-project.git
cd your-project/
npm start
```

Needs more description…

### Developing
```shell
npm dev
```

Needs more description…

### Building
```shell
npm build
```

We use [Buddy](https://buddy.works/) (or something similar) for Deploying.

## Gulp Tasks & NPM Scripts
```shell
npm start
npm dev
npm dev:single
<% if (projectType === 'craftCMS3' ) { %>npm update<% } %>
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
npm create:criticalcss
npm create:favicons
npm create:inlineJS
npm webpack
npm webpack:analyze
```

All scripts are also executable with YARN.
More detailed Infos about this Tasks & Scripts: [scripts.md](./docs/scripts-tasks.md)

## Sass Functions & Mixins
```scss
later
```

More detailed Infos about this Sass Functions & Mixins: [scripts.md](./docs/functions-mixins.md)

## Style guide
[Fractal](http://fractal.build/) is out tool of choice but it's not implemented for now. Update here when its done.

## Runs with Baukasten
```txt
   baukasten made with love & help.
   ---------------------------------------
   Author   :   David Hellmann
   Website  :   https://davidhellmann.com
   Github   :   https://github.com/davidhellmann/generator-baukasten
```
