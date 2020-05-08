<template>
  <div class="layout_root">
    <the-header :user="ViewProps.currentUser"></the-header>
    <div class="spacer"></div>
    <div class="page_wrapper">
      <Page :props="ViewProps"></Page>
    </div>
  </div>
</template>

<script>
import { Page, ViewProps } from "./vars";
import TheHeader from "~/components/TheHeader";

export default {
  components: {
    Page,
    "the-header": TheHeader,
  },
  data: () => ({
    ViewProps,
  }),
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
