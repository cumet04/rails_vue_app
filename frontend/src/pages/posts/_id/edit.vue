<template>
  <main>
    <h1>Edit post</h1>
    <form :action="`/posts/${post.id}`" method="post">
      <csrf-token-input></csrf-token-input>
      <input type="hidden" name="_method" value="put" />
      <div class="form-field">
        <label>
          title
          <input type="text" name="title" :value="post.title" />
        </label>
      </div>
      <div class="form-field">
        <label>
          content
          <textarea name="content" :value="post.content"></textarea>
        </label>
      </div>
      <button type="submit">post</button>
    </form>
  </main>
</template>

<script>
export default {
  props: ["props"],
  computed: {
    post() {
      return this.props.post;
    },
  },
};
</script>

<style lang="scss" scoped>
input,
textarea {
  border: black solid 1px;
}

button {
  background-color: lightgrey;
}
</style>
