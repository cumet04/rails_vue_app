const fs = require("fs");
const path = require("path");

const getFiles = (dirpath, list) => {
  const dirents = fs.readdirSync(dirpath, {withFileTypes: true})
  for (const dirent of dirents) {
    const fp = path.join(dirpath, dirent.name);
    if (dirent.isDirectory()) {
      getFiles(fp, list);
    } else {
      list.push(fp);
    }
  }
  return list
}

const basePath = "src/pages"
const importMap = getFiles(basePath, []).
  map(path => path.replace(`${basePath}/`, "").replace(".vue", "")).
  map(path => ({
    file: `./pages/${path}`,
    varname: path.replace("/", "___"),
    cmpname: path.replace("/", "---")
  }))

const importOut = importMap.map(item => {
  return `import ${item.varname} from "${item.file}"`
}).join('\n');

const exportOut = importMap.map(item => {
  return `"${item.cmpname}": ${item.varname}`
}).join(',\n');

fs.writeFileSync("src/pages.js", `
${importOut}

export let Pages = {
${exportOut}
}
`)
