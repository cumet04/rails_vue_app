<template>
  <main>
    <h1>users</h1>
    <ul>
      <li v-for="user in users" :key="user.id">
        <a :href="`/users/${user.id}`"> {{ user.id }}: {{ user.email }} </a>
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

<style lang="postcss" scoped>
</style>
