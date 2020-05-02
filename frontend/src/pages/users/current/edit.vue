<template>
  <main>
    <h1>Edit user profile</h1>
    <rails-form class="form" action="/users/current" method="put">
      <input
        class="input input_line"
        type="text"
        name="name"
        placeholder="Your name for display"
        :value="props.user.name"
      />
      <textarea
        class="input input_area"
        name="biography"
        placeholder="Introduce yourself (optional)"
        :value="props.user.biography"
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
    height: 100px;
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
