
const { resolve } = require('path');
const webpack = require('webpack');
const WebpackNotifier = require('webpack-notifier');

module.exports = {

  entry: {
    all: './source/javascripts/all.js',
  },

  resolve: {
    root: [
      resolve('./source/javascripts')
    ]
  },

  output: {
    path: resolve('./.tmp/dist'),
    filename: 'javascripts/[name].js'
  },

  module: {
    loaders: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loaders: ['babel']
      }
    ]
  },

  plugins: [
    new webpack.ProvidePlugin({
    }),
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
    }),
    new WebpackNotifier({
      alwaysNotify: true
    })
  ]

};
