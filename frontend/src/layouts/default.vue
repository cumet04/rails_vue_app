<template>
  <div>
    <header>some header</header>
    <Page :props="PageProps"></Page>
  </div>
</template>

<script>
import { Page, PageProps } from "./vars";

export default {
  components: {
    Page,
  },
  data: () => ({
    PageProps,
  }),
};
</script>
