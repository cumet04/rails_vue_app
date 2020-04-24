import Vue from "vue";
import { Pages } from "./pages";

const pageName = window._pageName.replace("/", "---");
new Vue({
  el: "#app",
  components: Pages,
  template: document.createElement(pageName).outerHTML,
});
