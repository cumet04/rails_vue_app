<template>
  <main>
    <h1>Edit post</h1>
    <rails-form :action="`/posts/${post.id}`" method="put">
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
    </rails-form>
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
