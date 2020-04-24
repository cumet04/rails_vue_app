import Vue from "vue";
import { Pages } from "./pages";

const pageName = window._pageName
  .replace(/^\//, "") // trim initial slash
  .replace(/\/$/, "") // trim trailing slash
  .replace(/^$/, "index") // "index" for "/"
  .replace("/", "---");
new Vue({
  el: "#app",
  components: Pages,
  template: document.createElement(pageName).outerHTML,
});
