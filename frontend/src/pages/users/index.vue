<template>
  <main>
    <h1>users</h1>
    <ul>
      <li v-for="user in users" :key="user.id">
        {{ user.id }}: {{ user.email }}
      </li>
    </ul>
  </main>
</template>

<script>
export default {
  props: ["props"],
  computed: {
    users() {
      return this.props.users || [];
    },
  },
};
</script>

<style lang="scss" scoped>
</style>
