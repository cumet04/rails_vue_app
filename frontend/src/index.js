import Vue from "vue";
import Layout from "~/layouts/default";

import RailsForm from "~/components/RailsForm";
Vue.component("rails-form", RailsForm);

new Vue({
  el: "#app",
  components: { Layout },
  template: `<Layout></Layout>`,
});
