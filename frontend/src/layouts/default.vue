<template>
  <div class="layout_root">
    <the-header :user="props.currentUser"></the-header>
    <div class="spacer"></div>
    <div class="page_wrapper">
      <Page :props="props"></Page>
    </div>
  </div>
</template>

<script>
import { Page } from "../vars";
import TheHeader from "~/components/TheHeader";

export default {
  props: ["props"],
  components: {
    Page,
    "the-header": TheHeader,
  },
};
</script>

<style lang="postcss" scoped>
.layout_root {
  min-height: 100vh;
  background-color: #eee;
}

.spacer {
  height: 20px;
}

.page_wrapper {
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}
</style>
