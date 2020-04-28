const chokidar = require("chokidar");
const gen_imports = require("./gen_imports");

chokidar.watch("src/pages", { atomic: true }).on("all", (event, path) => {
  const add_or_remove = event == "add" || event == "unlink";
  if (add_or_remove && path.endsWith(".vue")) gen_imports();
});
