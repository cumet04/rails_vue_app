<template>
  <div>
    <p>{{ props.title }}</p>
    <a href="users">users</a>
    <a href="posts">posts</a>
  </div>
</template>

<script>
export default {
  props: ["props"],
};
</script>
