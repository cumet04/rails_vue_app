const webpack = require("webpack");
const path = require("path");
const VueLoaderPlugin = require("vue-loader/lib/plugin");

const port = process.env.PORT || 8080;
const assets_path = "/assets";

module.exports = {
  entry: ["./src/index.js"],
  output: {
    path: path.resolve(__dirname, `dist${assets_path}`),
    filename: "bundle.js",
  },
  mode: "production",
  devServer: {
    port,
    host: "0.0.0.0",
    disableHostCheck: true,
    publicPath: assets_path,
    sockPath: `${assets_path}/sockjs-node`,
  },
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: "vue-loader",
      },
      {
        test: /\.js$/,
        loader: "babel-loader",
      },
      {
        test: /\.css$/,
        use: ["vue-style-loader", "css-loader"],
      },
      {
        test: /\.postcss$/,
        use: ["vue-style-loader", "css-loader", "postcss-loader"],
      },
      {
        test: /\.svg$/,
        use: [
          {
            loader: "file-loader",
            options: {
              esModule: false,
            },
          },
        ],
      },
    ],
  },
  resolve: {
    extensions: [".js", ".vue"],
    alias: {
      vue$: "vue/dist/vue.esm.js",
      "~": path.resolve(__dirname, "src"),
    },
  },
  plugins: [
    new VueLoaderPlugin(),
    new webpack.DefinePlugin({
      ASSETS_PATH: JSON.stringify(assets_path),
    }),
  ],
};
