var config = {
   entry: './main.js',
	
   output: {
      path:'/',
      filename: 'index.js',
   },
	
   devServer: {
      inline: true,
      port: 8080
   },
	devServer: {
      historyApiFallback: true,
   },
   module: {
      loaders: [
         {
            test: /\.jsx?$/,
            exclude: /node_modules/,
            loader: 'babel-loader',
				
            query: {
               presets: ['es2015', 'react'],
               plugins: ['react-html-attrs', 'transform-class-properties', 'transform-decorators-legacy']
            }
         },
         {test: /\.css$/, loader: 'style-loader!css-loader'},
         {test: /(\.eot|\.woff2|\.woff|\.ttf|\.svg)/, loader: 'file-loader'}
      ]
   }
}

module.exports = config;
