const path = require("path");
const VueLoaderPlugin = require("vue-loader/lib/plugin");

const port = process.env.PORT || 8080;

module.exports = {
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "../backend/public/assets"),
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
        test: /\.scss$/,
        use: ["vue-style-loader", "css-loader", "sass-loader"],
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
  plugins: [new VueLoaderPlugin()],
};
