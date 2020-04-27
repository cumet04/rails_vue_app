<template>
  <div>
    <p>{{ props.title }}</p>
    <form action="/" method="post">
      <csrf-token-input></csrf-token-input>
      <input type="text" name="title" />
      <button type="submit">post</button>
    </form>
  </div>
</template>

<script>
import CsrfTokenInput from "~/components/CsrfTokenInput";

export default {
  props: ["props"],
  components: {
    "csrf-token-input": CsrfTokenInput,
  },
};
</script>

<style lang="scss" scoped>
input {
  border: black solid 1px;
}
</style>
