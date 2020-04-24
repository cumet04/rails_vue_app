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

// generate {filename / variable name / component name} map
const basePath = "src/pages";
const paths = getFiles(basePath, []).map((path) => {
  // "src/pages/nested/somepage.vue" => "nested/somepage"
  return path.replace(`${basePath}/`, "").replace(".vue", "");
});

function filename(path) {
  return `./pages/${path}`;
}
function varname(path) {
  return path.replace("/", "___");
}
function cmpname(path) {
  return path
    .replace(/\/index/, "") // remove "/index"; normalize
    .replace(/^$/, "index") // "index" for "/"
    .replace("/", "---");
}

// file outputs
const importOut = paths
  .map((path) => {
    return `import ${varname(path)} from "${filename(path)}"`;
  })
  .join("\n");

const exportOut = paths
  .map((path) => {
    return `"${cmpname(path)}": ${varname(path)}`;
  })
  .join(",\n");

const output = `
${importOut}

export let Pages = {
${exportOut}
}
`;
fs.writeFileSync("src/pages.js", output);
