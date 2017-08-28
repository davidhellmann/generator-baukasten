/**
 * Webpack Config
 *
 * @package generator-baukasten
 * @author David Hellmann <david@hellmann.io>
 */

import {BundleAnalyzerPlugin} from 'webpack-bundle-analyzer'
import {getIfUtils, removeEmpty} from 'webpack-config-utils'
import DashboardPlugin from 'webpack-dashboard/plugin';
import ExtractTextPlugin from 'extract-text-webpack-plugin'
import FriendlyErrorsWebpackPlugin from 'friendly-errors-webpack-plugin'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import OptimizeCSSPlugin from 'optimize-css-assets-webpack-plugin';
import StyleLintPlugin from 'stylelint-webpack-plugin'
import webpack from 'webpack'
import WriteFilePlugin from 'write-file-webpack-plugin'
import path from 'path'
import config from '../package.json'

// get absolute path of files based on root
function resolve(dir) {
    return path.resolve(__dirname, `../${dir}`)
}

const {ifProduction, ifDevelopment} = getIfUtils(process.env.NODE_ENV)

// der string wird benötigt um hot reloading nutzen zu können
// der wird einfach an den entry point gehangen
const hot_client = 'webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true&overlay=true'

// hier holen wir uns die dateien in die wir unsere Build Files (app.23r23fwef23r.js und app.323r233.css zum beispiel injecten wollen, also eine datei für den header und eine für den footer)
// dann definieren wir noch wo die hinsollen und bauen eine funktion die das plugin ausspuckt

const inject_folder = '_partials/webpack'
const inject_templates = [
    {
        // wo soll es hingehen
        filename: resolve(`${config.dist.markup + inject_folder}/webpack-header.html`),
        // src file
        file: `${config.src.templates + inject_folder}/webpack-header.html`,
        inject: false
    },
    {
        // wo soll es hingehen
        filename: resolve(`${config.dist.markup + inject_folder}/webpack-scripts.html`),
        // src file
        file: `${config.src.templates + inject_folder}/webpack-scripts.html`,
        inject: false
    }
]

// leeres array welches wir später mittels ...restParameter in die Plugins mit einfügen
const chunks = []
// befüllen des obigen array mit den chunks die wir definiert haben.
inject_templates.forEach((chunk) => {
    const plugin = new HtmlWebpackPlugin({
        filename: chunk.filename,
        template: chunk.file,
        inject: chunk.inject,
        minify: false,
        chunksSortMode: 'dependency'
    })
    chunks.push(plugin)
})

// sass resources loader
// damit werden die angegebenen dateien automatisch injected
// das ist besonders praktisch für Vue files wenn du deine tools und settings benutzen willst aber nicht in jn der Komponente die entsprechenden Dateien includen willst.
// definieren wir hier oben als variable um sie evtl. später auch anderweitig nutzen zu können
const sass_resources_loader = {
    loader: 'sass-resources-loader',
    options: {
        resources: [resolve(`${config.src.css}_settings.scss`), resolve(`${config.src.css}_tools.scss`)]
    }
}

// css loader config
// kannst du später dann auch benutzen, ist für Vue und "normales" css ähnlich
const SCSS_LOADERS = [
    {
        loader: 'css-loader',
        options: {
            autoprefixer: false,
            sourceMap: true,
            importLoaders: 3,
            url: false
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
]
const CSS_LOADERS = [
    {
        loader: 'css-loader',
        options: {
            autoprefixer: false,
            sourceMap: true,
            importLoaders: 2,
            url: false
        }
    },
    {
        loader: 'postcss-loader',
        options: {
            sourceMap: true
        }
    }
]

module.exports = {
    devtool: ifProduction('#source-map', '#eval-cheap-module-source-map'),
    // javascript file in dem alles importiert wird, erstmal der simpelste zweck

    // hier ein object, jede datei die hier definiert wird kommt als eigener outputh raus, also wenn du eine admin.js im src folder machst kommt eine admin.js in den dist folder raus
    entry: {
        app: ifDevelopment([resolve(`${config.src.js}app.js`), hot_client], resolve(`${config.src.js}app.js`))
    },
    output: {
        // in das verzeichnis kommt alles rein
        path: resolve(config.dist.base),
        publicPath: '',
        // [name] sorgt dafür das der key aus dem entry object als dateiname benutzt wird
        filename: ifProduction('assets/js/[name].[hash].min.js', 'assets/js/[name].js'),
        chunkFilename: 'assets/js/[name].[chunkhash].js'
    },
    resolve: {
        extensions: ['.js', '.json', '.vue'],
        // hier werden verzeichnisse angegeben in denen gesucht wird wenn du was importierst
        // also import from 'foo/bar' dann schaut er in diesen verzeichnissen wo bar.js sein könnte
        modules: [resolve('___src'), resolve('node_modules')],
        // aliase sind ne schöne sache du kannst dir hier zum beispiel auch deinen modules pfad einbauen
        // nehmen wir dein Alias hieße Modules, dann kannst du in JS Files
        // einfach import foo from 'Modules/foo/foo'; machen
        // mit Storm hast du auch Autocomplete in diesen Aliasen
        alias: {
            // alias der auf den Standalone Build geht, falls du Vue ausserhalb von
            // Single File Components nutzen möchtest
            vue$: 'vue/dist/vue.common.js',
            Modules: resolve(config.src.modules.base),
            CSS: resolve(config.src.css),
            '@': resolve(config.src.base),
            JS: resolve(config.src.js),
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
                include: resolve('___src')
            },
            // hier dann das eigentliche laden von JS
            {
                test: /\.js/,
                loader: 'babel-loader',
                include: resolve('___src')
            },
            // Vue Loader Wohooo
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                include: resolve('___src'),
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
                                sourceMap: true,
                                convertToAbsoluteUrls: true
                            }
                        },
                        ...SCSS_LOADERS
                    ]
                ),
                include: resolve('___src')
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
                                sourceMap: true,
                                convertToAbsoluteUrls: true
                            }
                        },
                        ...CSS_LOADERS
                    ]
                ),
                include: resolve('___src')
            },
        ]
    },
    plugins: removeEmpty([
        // Dateiname für das Extracted CSS von Vue
        // wenn du dein eigenes css über webpack laufen lässt kommen beide in eine datei
        new ExtractTextPlugin({
            filename: 'assets/css/[name].[chunkhash].min.css',
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
            context: resolve(config.src.base),
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
        ifProduction(
            // extract webpack runtime and module manifest to its own file in order to
            // prevent vendor hash from being updated whenever app bundle is updated
            new webpack.optimize.CommonsChunkPlugin({
                name: 'manifest',
                chunks: ['vendor']
            })
        ),
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
}
