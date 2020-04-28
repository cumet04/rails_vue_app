<template>
  <main>
    <h1>Create new user</h1>
    <form action="/users" method="post">
      <csrf-token-input></csrf-token-input>
      <div class="form-field">
        <label>
          email
          <input type="email" name="email" />
        </label>
      </div>
      <div class="form-field">
        <label>
          password
          <input type="password" name="password" id="" />
        </label>
      </div>
      <button type="submit">sign up</button>
    </form>
  </main>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
input {
  border: black solid 1px;
}

button {
  background-color: lightgrey;
}
</style>
