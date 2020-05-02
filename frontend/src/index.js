import Vue from "vue";
import Layout from "~/layouts/default";

import RailsForm from "~/components/RailsForm";
Vue.component("rails-form", RailsForm);

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
