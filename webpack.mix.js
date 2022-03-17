const mix = require('laravel-mix');
const webpack = require('webpack');
const path = require('path');

require('laravel-mix-svg-vue');
require('laravel-vue-lang/mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/frontend/app.js', 'public/js/app.js')
    .copy('resources/js/frontend/serviceworker.js', 'public/serviceworker.js')
    .copy('resources/js/modules/push-notifications.js', 'public/js/push-notifications.js')
    .js('resources/js/backend/admin.js', 'public/js/admin.js')
    .sass('resources/sass/frontend/app.scss', 'public/css/app.css')
    .sass('resources/sass/backend/admin.scss', 'public/css/admin.css')
    //.copyDirectory('resources/img', 'public/img')
    .vue()
    .lang()
    .extract()
    .disableNotifications()
    .svgVue();

mix.webpackConfig({
    resolve: {
        alias: {
            '@lang': path.resolve('./resources/lang'),
            '@publicLang': path.resolve('./public/storage/lang'),
        },
    },
    module: {
        rules: [
            {
                test: /resources[\\\/]lang.+\.(php)$/,
                loader: 'php-array-loader',
            },
        ],
    },
    plugins: [
        new webpack.DefinePlugin({
            __VUE_OPTIONS_API__: true,
            __VUE_PROD_DEVTOOLS__: false,
        }),
    ],
});

if (mix.inProduction()) {


    mix.minify([
        'public/js/app.js',
        'public/js/vendor.js',
        'public/js/admin.js',
        'public/css/app.js',
        'public/css/admin.js',
    ]);

    mix.version();

} else {
    // Uses source-maps on development
    mix.sourceMaps(false, 'source-map');
    // mix.browserSync(process.env.APP_URL);
    mix.options({
        hmrOptions: {
            host: 'jobzz.loc',
            port: 8080
        }
    })
}

