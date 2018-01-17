/**
 * Webpack Config
 *
 * @package generator-baukasten
 * @author David Hellmann <david@hellmann.io>
 */

import {BundleAnalyzerPlugin} from 'webpack-bundle-analyzer';
import {getIfUtils, removeEmpty} from 'webpack-config-utils';
// import DashboardPlugin from 'webpack-dashboard/plugin'
import ExtractTextPlugin from 'extract-text-webpack-plugin';
import FriendlyErrorsWebpackPlugin from 'friendly-errors-webpack-plugin';
import HtmlWebpackPlugin from 'html-webpack-plugin';
import OptimizeCSSPlugin from 'optimize-css-assets-webpack-plugin';
import StyleLintPlugin from 'stylelint-webpack-plugin';
import webpack from 'webpack';
import WriteFilePlugin from 'write-file-webpack-plugin';
import path from 'path';
import pkg from '../package.json';

// get absolute path of files based on root
function resolve(dir) {
    return path.resolve(__dirname, `../${dir}`);
}

const {ifProduction, ifDevelopment} = getIfUtils(process.env.NODE_ENV);

// der string wird benötigt um hot reloading nutzen zu können
// der wird einfach an den entry point gehangen
const hot_client = 'webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true&overlay=true';

// hier holen wir uns die dateien in die wir unsere Build Files
// (app.23r23fwef23r.js und app.323r233.css zum beispiel injecten wollen,
// also eine datei für den header und eine für den footer)
// dann definieren wir noch wo die hinsollen und
// bauen eine funktion die das plugin ausspuckt
const inject_folder = <% if (projectType === 'wordpress' ) { %> '_partials/_webpack' <% } else { %> '_partials/webpack' <% } %>;
const fileExtension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>;
const headerFilenameSRC = <% if (projectType === 'wordpress' ) { %> '_webpack-header' <% } else { %> 'webpack-header' <% } %>;
const headerFilenameDIST = <% if (projectType === 'wordpress' ) { %> '_webpack-header' <% } else { %> 'webpack-header' <% } %>;
const scriptsFilenameSRC = <% if (projectType === 'wordpress' ) { %> '_webpack-scripts' <% } else { %> 'webpack-scripts' <% } %>;
const scriptsFilenameDIST = <% if (projectType === 'wordpress' ) { %> '_webpack-scripts' <% } else { %> 'webpack-scripts' <% } %>;
const folderDIST = pkg.dist.markup;


const inject_templates = [
    {
        // DIST File
        filename: resolve(`${folderDIST + inject_folder}/${headerFilenameDIST}${fileExtension}`),

        // SRC File
        file: `${pkg.src.templates + inject_folder}/${headerFilenameSRC}${fileExtension}`,
        inject: false
    },
    {
        // DIST File
        filename: resolve(`${folderDIST + inject_folder}/${scriptsFilenameDIST}${fileExtension}`),

        // SRC File
        file: `${pkg.src.templates + inject_folder}/${scriptsFilenameSRC}${fileExtension}`,
        inject: false
    }
];

// Leeres Array welches wir später mittels ...restParameter
// in die Plugins mit einfügen
const chunks = []

// Befüllen des obigen Arrays mit den chunks die wir definiert haben.
inject_templates.forEach((chunk) => {
    const plugin = new HtmlWebpackPlugin({
        filename: chunk.filename,
        template: chunk.file,
        inject: chunk.inject,
        minify: false,
        chunksSortMode: 'dependency'
    });
    chunks.push(plugin)
});

// Sass Resources Loader
// Damit werden die angegebenen Dateien automatisch injected
// Das ist besonders praktisch für Vue files. Wenn du deine Tools und Settings
// benutzen willst aber nicht in jn der Componente die entsprechenden Dateien includen willst.
// Definieren wir hier oben als variable um sie evtl. später auch anderweitig nutzen zu können.
const sass_resources_loader = {
    loader: 'sass-resources-loader',
    options: {
        resources: [resolve(`${pkg.src.css}_settings.scss`), resolve(`${pkg.src.css}_tools.scss`)]
    }
};

// SCSS Loader Config
const SCSS_LOADERS = [
    {
        loader: 'css-loader',
        options: {
            autoprefixer: false,
            sourceMap: true,
            importLoaders: 2,
            url: true
        }
    },
    {
        loader: 'postcss-loader',
        options: {
            sourceMap: true
        }
    },
    {
        loader: 'sass-loader',
        options: {
            sourceMap: true
        }
    }
];

// CSS Loader Config
const CSS_LOADERS = [
    {
        loader: 'css-loader',
        options: {
            autoprefixer: false,
            sourceMap: true,
            importLoaders: 2,
            url: true
        }
    },
    {
        loader: 'postcss-loader',
        options: {
            sourceMap: true
        }
    }
];

module.exports = {
    devtool: ifProduction('#source-map', '#eval-cheap-module-source-map'),

    // javascript file in dem alles importiert wird, erstmal der simpelste zweck
    // hier ein object, jede datei die hier definiert wird kommt als eigener outputh raus,
    // also wenn du eine admin.js im src folder machst kommt eine admin.js in den dist folder raus
    entry: {
        app: ifDevelopment([resolve(`${pkg.src.js}app.js`), hot_client], resolve(`${pkg.src.js}app.js`))
    },

        output: {
            // in das verzeichnis kommt alles rein
            path: resolve(`${pkg.dist.base}assets/`),
            publicPath: '/assets/',
            // [name] sorgt dafür das der key aus dem entry object als dateiname benutzt wird
            filename: ifProduction('js/[name].[hash].min.js', 'js/[name].js'),
            chunkFilename: 'js/[name].[chunkhash].js',
            hotUpdateChunkFilename: '[id].[hash].hot-update.js',
            hotUpdateMainFilename: '[hash].hot-update.json',
        },

    resolve: {
        extensions: ['.js', '.json', '.vue'],
        // hier werden verzeichnisse angegeben in denen gesucht wird wenn du was importierst
        // also import from 'foo/bar' dann schaut er in diesen verzeichnissen wo bar.js sein könnte
        modules: [resolve(pkg.src.base), resolve('node_modules')],
        // aliase sind ne schöne sache du kannst dir hier zum beispiel auch deinen modules pfad einbauen
        // nehmen wir dein Alias hieße Modules, dann kannst du in JS Files
        // einfach import foo from 'Modules/foo/foo'; machen
        // mit Storm hast du auch Autocomplete in diesen Aliasen
        alias: {
            // alias der auf den Standalone Build geht, falls du Vue ausserhalb von
            // Single File Components nutzen möchtest
            vue$: 'vue/dist/vue.esm.js',
            MODULES: resolve(pkg.src.modules.base),
            CSS: resolve(pkg.src.css),
            '@': resolve(pkg.src.base),
            JS: resolve(pkg.src.js),
            FONTS: resolve(pkg.src.fonts),
            ASSETS: resolve(pkg.src.images.base)
        }
    },

    module: {
        // hier wird definiert mit welcher datei was gemacht wird
        // das passiert über loader, hier kommen auch vue, css etc. rein später
        rules: [
            // als erstes ESLint für .js und .vue dateien
            {
                test: /\.(js|vue)$/,
                loader: 'eslint-loader',
                // damit weiß webpack das dieser loader vor allen anderen kommen soll
                enforce: 'pre',
                include: resolve(pkg.src.base)
            },

            // hier dann das eigentliche laden von JS
            {
                test: /\.js/,
                loader: 'babel-loader',
                include: resolve(pkg.src.base)
            },

            // Vue Loader Wohooo
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                include: resolve(pkg.src.base),
                options: {
                    loaders: {
                        scss: ifProduction(
                            ExtractTextPlugin.extract({
                                use: [...SCSS_LOADERS, sass_resources_loader]
                            }),
                            ['vue-style-loader', ...SCSS_LOADERS, sass_resources_loader]
                        )
                    }
                }
            },

            // SCSS Loading
            {
                test: /\.scss$/,
                use: ifProduction(
                    // extract Text Plugin für Production
                    ExtractTextPlugin.extract({
                        use: [...SCSS_LOADERS, sass_resources_loader],
                        fallback: 'style-loader'
                    }),
                    // im development fügen wir den style-loader ein um styles zu injecten
                    [
                        {
                            loader: 'style-loader',
                            options: {
                                sourceMap: true
                            }
                        },
                        ...SCSS_LOADERS
                    ]
                ),
                include: resolve(pkg.src.base)
            },

            // CSS Loading
            {
                test: /\.css$/,
                use: ifProduction(
                    // extract Text Plugin für Production
                    ExtractTextPlugin.extract({
                        use: [...CSS_LOADERS],
                        fallback: 'style-loader'
                    }),
                    // im development fügen wir den style-loader ein um styles zu injecten
                    [
                        {
                            loader: 'style-loader',
                            options: {
                                sourceMap: true
                            }
                        },
                        ...CSS_LOADERS
                    ]
                ),
                include: resolve(pkg.src.base)
            },
            {
                test: /\.(png|jpg|gif|svg)$/,
                include: resolve(pkg.src.base),
                loader: 'url-loader',
                options: {
                    limit: 10000,
                    name: (filePath) => {
                        const filename = path.basename(filePath)
                        const folder = path.relative(pkg.src.images.base, filePath).replace(filename, '')
                        return `${folder}[name].[hash:4].[ext]`
                    },
                }
            },
            {
                // Match woff2 in addition to patterns like .woff?v=1.1.1.
                test: /\.(woff|woff2|ttf|eot)(\?v=\d+\.\d+\.\d+)?$/,
                loader: 'url-loader',
                include: resolve(pkg.src.base),
                options: {
                    // Limit at 10k. Above that it emits separate files
                    limit: 10000,

                    // url-loader sets mimetype if it's passed.
                    // Without this it derives it from the file extension
                    mimetype: 'application/font-woff',

                    // Output below fonts directory
                    name: 'fonts/[name].[ext]',
                }
            },
        ]
    },

    plugins: removeEmpty([
        // Dateiname für das Extracted CSS von Vue
        // wenn du dein eigenes css über webpack laufen lässt kommen beide in eine datei
        new ExtractTextPlugin({
            filename: 'css/[name].[chunkhash].min.css',
            allChunks: true
        }),

        // Webpack Dashboard
        // Breaks the Build Task
        // Todo: Refactor / Problem Solving
        // ifDevelopment(new DashboardPlugin({ port: 3002 })),

        // nötig für HMR
        ifDevelopment(new webpack.HotModuleReplacementPlugin()),
        ifDevelopment(new webpack.NamedModulesPlugin()),
        ifDevelopment(new webpack.NoEmitOnErrorsPlugin()),
        ifDevelopment(new FriendlyErrorsWebpackPlugin()),

        // Webpack Bundle Analyzer
        ifProduction(
            new BundleAnalyzerPlugin({
                analyzerMode: 'disabled',
                generateStatsFile: true,
                statsFilename: resolve('webpack/stats.json'),
                logLevel: 'info'
            })
        ),

        // Optimize CSS Asset Stuff
        ifProduction(
            new OptimizeCSSPlugin({
                cssProcessorOptions: {
                    safe: true,
                },
            }),
        ),

        <% if (projectjQuery) { %>
        // jQuery Stuff
        new webpack.ProvidePlugin({
           $: 'jquery',
           jQuery: 'jquery'
        }),
        <% } %>

        // Uglify JS
        ifProduction(
            new webpack.optimize.UglifyJsPlugin({
                sourceMap: true,
                compress: {
                    warnings: false
                }
            })
        ),

        // Stylelint Stuff
        new StyleLintPlugin({
            context: resolve(pkg.src.base),
            syntax: 'scss',
            quiet: false
        }),

        // commons chunk shizzle
        // damit werden automatisch libraries wie Vue, jQuery (haha)
        // und andere automatisch in ne extra datei gesplittet
        // dadurch kann das vom browser gecached werden
        ifProduction(
            new webpack.optimize.CommonsChunkPlugin({
                name: 'vendor',
                minChunks(module) {
                    // this assumes your vendor imports exist in the node_modules directory
                    return module.context && module.context.indexOf('node_modules') !== -1
                }
            })
        ),

        // extract webpack runtime and module manifest to its own file in order to
        // prevent vendor hash from being updated whenever app bundle is updated
        ifProduction(
            new webpack.optimize.CommonsChunkPlugin({
                name: 'manifest',
                chunks: ['vendor']
            })
        ),

        // Minimize Stuff
        ifProduction(
            new webpack.LoaderOptionsPlugin({
                minimize: true
            })
        ),

        // funktion aus den webpack-utils
        // wird nur ausgeführt wenn das NODE_ENV auf production steht
        ifProduction(
            // hier wird den loadern etc. mitgeteilt das es in den production mode geht
            new webpack.DefinePlugin({
                'process.env': {
                    NODE_ENV: '"production"'
                }
            })
        ),

        // Hier das Array der Chunks mit dem Plugin Array zusammenfügen
        ...chunks,

        new WriteFilePlugin({
            log: true,
            test: /^(?!.+(?:hot-update.(js|json))).+$/
        }),

        // webpack scope hoisting magic, weiß ich auch nicht so genau was es tut :D
        ifProduction(new webpack.optimize.ModuleConcatenationPlugin())
    ])
};
