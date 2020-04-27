<template>
  <input type="hidden" :name="param" :value="token" />
</template>

<script>
export default {
  data: () => ({
    param: document.head.children["csrf-param"].content,
    token: document.head.children["csrf-token"].content,
  }),
};
</script>
