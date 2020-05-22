<template>
  <main>
    <h1>Create new post</h1>
    <rails-form class="form" action="/posts" method="post">
      <input
        class="input line"
        type="text"
        name="title"
        placeholder="Awesome post title"
        required
      />
      <textarea
        class="input area"
        name="content"
        placeholder="Awesome post content"
        required
      ></textarea>
      <div class="button_area">
        <button class="button" type="submit">POST</button>
      </div>
    </rails-form>
  </main>
</template>

<script>
export default {};
</script>

<style lang="postcss" scoped>
.form {
  background-color: white;
  padding: 16px;
}

.input {
  display: block;
  width: 100%;
  margin-bottom: 20px;
  padding: 5px;

  &.line {
    border-bottom: lightgray solid 1px;
  }

  &.area {
    resize: none;
    height: 500px;
    border: lightgray solid 1px;
  }
}

.button_area {
  display: flex;
  justify-content: flex-end;
}

.button {
  background-color: lightblue;
  padding: 5px 15px;
  font-size: 1.8rem;
}
</style>
