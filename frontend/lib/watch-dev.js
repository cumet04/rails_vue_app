const chokidar = require("chokidar");
const genImports = require("./gen-imports");

chokidar.watch("src/pages", { atomic: true }).on("all", (event, path) => {
  const add_or_remove = event == "add" || event == "unlink";
  if (add_or_remove && path.endsWith(".vue")) genImports();
});
