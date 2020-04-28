import Vue from "vue";
import Layout from "~/layouts/default";

import CsrfTokenInput from "~/components/CsrfTokenInput";
Vue.component("csrf-token-input", CsrfTokenInput);

new Vue({
  el: "#app",
  components: { Layout },
  template: `<Layout></Layout>`,
});
