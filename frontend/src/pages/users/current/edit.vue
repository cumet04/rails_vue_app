<template>
  <main>
    <h1>Edit user profile</h1>
    <rails-form class="form" action="/users/current" method="put">
      <input
        class="input line"
        type="text"
        name="name"
        placeholder="Your name for display"
        :value="props.user.name"
        required
      />
      <textarea
        class="input area"
        name="biography"
        placeholder="Introduce yourself (optional)"
        :value="props.user.biography"
        required
      ></textarea>
      <div class="button_area">
        <button class="button" type="submit">UPDATE</button>
      </div>
    </rails-form>
  </main>
</template>

<script>
export default {
  props: ["props"],
};
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
    height: 100px;
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
