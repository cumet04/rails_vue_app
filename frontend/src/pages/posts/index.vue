<template>
  <main>
    <h1>posts</h1>
    <ul>
      <li v-for="post in posts" :key="post.id">
        <a :href="`/posts/${post.id}`">{{ post.title }}</a>
      </li>
    </ul>
  </main>
</template>

<script>
export default {
  props: ["props"],
  computed: {
    posts() {
      return this.props.posts || [];
    },
  },
};
</script>

<style lang="postcss" scoped>
</style>
