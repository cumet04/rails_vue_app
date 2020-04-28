// ---------- filetree ----------
// src/
//   index.js
//   pages.js
//   pages/
//     index.vue
//     nested/
//       index.vue
//       some.vue
// ---------- pages.js ----------
// export let Pages = {
//   "index": require("./pages/index").default,
//   "nested": require("./pages/nested/index").default,
//   "nested/some": require("./pages/nested/some").default,
// };
// ------------------------------

const fs = require("fs");
const path = require("path");

// $ find dirpath -type f -name "*.vue"
const getFiles = (dirpath, list) => {
  const dirents = fs.readdirSync(dirpath, { withFileTypes: true });
  for (const dirent of dirents) {
    const fp = path.join(dirpath, dirent.name);
    if (dirent.isDirectory()) {
      getFiles(fp, list);
    } else {
      if (fp.endsWith(".vue")) list.push(fp);
    }
  }
  return list;
};

function run() {
  console.log("generate pages.js");
  const output = getFiles("src/pages", [])
    .map((path) => {
      return path.replace("src/pages/", "").replace(".vue", "");
    })
    .map((file) => {
      const path = file
        .replace(/\/index/, "") // remove "/index"; normalize
        .replace(/^$/, "index"); // "index" for "/"
      return `"${path}": require("./pages/${file}").default`;
    })
    .join(",");

  fs.writeFileSync("src/pages.js", `export let Pages = {${output}}`);
}

module.exports = run;

if (!module.parent) run();
