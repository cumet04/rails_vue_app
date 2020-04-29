<template>
  <main>
    <p>title: {{ props.post.title }}</p>
    <p>posted: {{ props.post.createdAt }}</p>
    <p>content:</p>
    <p>{{ props.post.content }}</p>
  </main>
</template>

<script>
export default {
  props: ["props"],
};
</script>

<style lang="scss" scoped>
</style>
