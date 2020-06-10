import "../node_modules/ress/dist/ress.min.css";
import "~/assets/css/common.css";

import Vue from "vue";
import Layout from "~/layouts/default";
import { ViewProps } from "./vars";
import axios from "axios";

import RailsForm from "~/components/RailsForm";
Vue.component("rails-form", RailsForm);

Vue.prototype.$axios = axios.create({
  headers: { "X-CSRF-TOKEN": document.head.children["csrf-token"].content },
});
Vue.prototype.$appData = {
  // MEMO: Maybe it's good to use vuex
  currentUser: ViewProps.currentUser,
};

Vue.mixin({
  methods: {
    imageUrl(path) {
      const file = require(`~/assets/images/${path}`);
      return `${ASSETS_PATH}/${file}`;
    },
  },
});

new Vue({
  el: "#app",
  components: { Layout },
  data: { props: ViewProps },
  template: `<Layout :props="props"></Layout>`,
});
