import Vue from "vue";
import { Pages } from "./pages";

const pageName = window._application.path
  .replace(/^\//, "") // trim initial slash
  .replace(/\/$/, "") // trim trailing slash
  .replace(/^$/, "index"); // "index" for "/"

new Vue({
  el: "#app",
  components: {
    Page: Pages[pageName],
  },
  data: {
    props: window._application.props,
  },
  template: `<Page :props="props"></Page>`,
});
