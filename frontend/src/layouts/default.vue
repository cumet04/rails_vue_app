<template>
  <div>
    <the-header :user="ViewProps.user"></the-header>
    <Page :props="ViewProps.pageProps"></Page>
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
