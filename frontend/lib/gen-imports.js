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
// import _page1 from "/src/pages/index"
// import _page2 from "/src/pages/nested/index"
// import _page3 from "/src/pages/nested/some"
// export let Pages = {
//   "index": _page1,
//   "nested": _page2,
//   "nested/some": _page3,
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
  const mapping = getFiles("src/pages", [])
    .map((path) => {
      return path.replace("src/pages/", "").replace(".vue", "");
    })
    .map((file) => {
      const path = file
        .replace(/\/index/, "") // remove "/index"; normalize
        .replace(/^$/, "index"); // "index" for "/"
      return {
        path,
        file: `./pages/${file}.vue`,
      };
    });

  fs.writeFileSync(
    "src/pages.js",
    mapping
      .map((pair, i) => `import _page${i} from "${pair.file}"`)
      .join("\n") +
      "\nexport let Pages = {" +
      mapping.map((pair, i) => `"${pair.path}": _page${i},`).join("\n") +
      "}"
  );
}

module.exports = run;

if (!module.parent) run();
