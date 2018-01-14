const extend = require('deep-extend')

function addMinifyImagesSettings(files = {}) {
    extend(files.pkg, {
        minify: {
            images: {
                optimizationLevel: 3,
                jpegCompress: {
                    loops: 6,
                    min: 80,
                    max: 90
                },
                pngquant: {
                    quality: '90',
                    speed: 4
                },
                svgoPlugins: [
                    { cleanupIDs: false },
                    { removeComments: true },
                    { removeViewBox: false },
                    { removeDesc: true },
                    { removeTitle: true },
                    { removeUselessDefs: false },
                    { removeDoctype: true },
                    { removeEmptyText: true },
                    { removeUnknownsAndDefaults: true },
                    { removeEmptyContainers: true },
                    { collapseGroups: true },
                    { sortAttrs: true },
                    { removeUselessStrokeAndFill: true },
                    { convertStyleToAttrs: true }
                ],
                progressive: true,
                interlaced: true
            }
        }
    })
}

module.exports = addMinifyImagesSettings
