const webpack = require("webpack");
const path = require("path");
const VueLoaderPlugin = require("vue-loader/lib/plugin");

const port = process.env.PORT || 8080;
const assets_path = "/assets";

module.exports = {
  entry: ["./src/index.js"],
  output: {
    path: path.resolve(__dirname, `../backend/public${assets_path}`),
    filename: "bundle.js",
  },
  mode: "production",
  devServer: {
    port,
    contentBase: path.resolve(__dirname, "public"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET",
      "Access-Control-Allow-Headers":
        "X-Requested-With, content-type, Authorization",
    },
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
      ASSETS_PATH:
        process.env.NODE_ENV == "development"
          ? JSON.stringify(`http://localhost:${port}`)
          : JSON.stringify(assets_path),
    }),
  ],
};
