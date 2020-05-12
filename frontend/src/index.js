import "/node_modules/ress/dist/ress.min.css";
import "./assets/css/common.css";

import { createApp } from "vue";
import Layout from "./layouts/default.vue";

import RailsForm from "./components/RailsForm.vue";

createApp(Layout).component("rails-form", RailsForm).mount("#app");
