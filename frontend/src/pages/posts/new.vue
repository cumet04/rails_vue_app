<template>
  <main>
    <h1>Create new post</h1>
    <form action="/posts" method="post">
      <csrf-token-input></csrf-token-input>
      <div class="form-field">
        <label>
          title
          <input type="text" name="title" />
        </label>
      </div>
      <div class="form-field">
        <label>
          content
          <textarea name="content"></textarea>
        </label>
      </div>
      <button type="submit">post</button>
    </form>
  </main>
</template>

<script>
export default {};
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
