<template>
  <form :action="action" :method="formMethod">
    <input
      v-if="hiddenMethod"
      type="hidden"
      name="_method"
      :value="hiddenMethod"
    />
    <input type="hidden" :name="param" :value="token" />
    <slot></slot>
  </form>
</template>

<script>
export default {
  props: ["action", "method"],
  data: () => ({
    param: document.head.children["csrf-param"].content,
    token: document.head.children["csrf-token"].content,
  }),
  computed: {
    formMethod() {
      const m = this.method.toUpperCase();
      return m == "GET" || m == "POST" ? m : "POST";
    },
    hiddenMethod() {
      const m = this.method.toUpperCase();
      return m == "GET" || m == "POST" ? null : m;
    },
  },
};
</script>
