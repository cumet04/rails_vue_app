<template>
  <main>
    <h1>Edit post</h1>
    <rails-form class="form" :action="`/posts/${post.id}`" method="put">
      <input
        class="input input_line"
        type="text"
        name="title"
        placeholder="Awesome post title"
        :value="post.title"
      />
      <textarea
        class="input input_area"
        name="content"
        placeholder="Awesome post content"
        :value="post.content"
      ></textarea>
      <div class="button_area">
        <button class="button" type="submit">POST</button>
      </div>
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
.form {
  background-color: white;
  padding: 16px;
}

.input {
  display: block;
  width: 100%;
  margin-bottom: 20px;
  padding: 5px;

  &_line {
    border-bottom: lightgray solid 1px;
  }

  &_area {
    resize: none;
    height: 500px;
    border: lightgray solid 1px;
  }
}

.button {
  background-color: lightblue;
  padding: 5px 15px;
  font-size: 1.8rem;

  &_area {
    display: flex;
    justify-content: flex-end;
  }
}
</style>

