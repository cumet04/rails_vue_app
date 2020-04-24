import Vue from "vue";
import { Pages } from "./pages";

const pageName = window._application.path
  .replace(/^\//, "") // trim initial slash
  .replace(/\/$/, "") // trim trailing slash
  .replace(/^$/, "index") // "index" for "/"
  .replace("/", "---");

const template = document.createElement(pageName);
template.setAttribute(":props", "props");

window.vm = new Vue({
  el: "#app",
  components: Pages,
  data: {
    props: window._application.props,
  },
  template: template.outerHTML,
});
