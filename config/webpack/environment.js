const { environment } = require('@rails/webpacker')
// const { VueLoaderPlugin } = require('vue-loader')
// const vue = require('./loaders/vue')

// environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
// environment.loaders.prepend('vue', vue)

// Vue.js フル版（Compiler入り）
// environment.config.resolve.alias = { 'vue$': 'vue/dist/vue.esm.js' }

// jQueryとBootstapのJSを使えるように
module.exports = environment
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
