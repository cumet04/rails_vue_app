import "../node_modules/ress/dist/ress.min.css";
import "~/assets/css/common.css";

import Vue from "vue";
import Layout from "~/layouts/default";
import axios from "axios";

import RailsForm from "~/components/RailsForm";
Vue.component("rails-form", RailsForm);

Vue.prototype.$axios = axios.create({
  headers: { "X-CSRF-TOKEN": document.head.children["csrf-token"].content },
});

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
  template: `<Layout></Layout>`,
});
