const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugin.prepend(
    'provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        Popper: 'popper.js'
    })
)