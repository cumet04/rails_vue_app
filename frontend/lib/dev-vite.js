const path = require("path");
const rewrite = require("koa-rewrite");
const { createServer } = require("vite");

const prefix = "/assets";

const prefixResolver = {
  requestToFile: (publicPath, root) => {},
  fileToRequest: (filePath, root) => {
    // TODO: slash()
    const absRoot = path.resolve(root);
    const req = path.join(prefix, path.relative(absRoot, filePath));
    console.log(absRoot);
    console.log(filePath);
    console.log(path.relative(absRoot, filePath));
    console.log(req);
    return req;
  },
  idToRequest: (id) => path.join(prefix, "@modules", id),
};

const prefixPlugin = ({ app }) => {
  app.use(rewrite(new RegExp(`^${prefix}(.*)`), "$1"));
};

createServer({
  root: "src",
  plugins: [prefixPlugin],
  resolvers: [prefixResolver],
}).listen(process.env.PORT || 3000);
