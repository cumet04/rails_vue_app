<template>
  <div>
    <the-header></the-header>
    <Page :props="PageProps"></Page>
  </div>
</template>

<script>
import { Page, PageProps } from "./vars";
import TheHeader from "~/components/TheHeader";

export default {
  components: {
    Page,
    "the-header": TheHeader,
  },
  data: () => ({
    PageProps,
  }),
};
</script>
