<template>
  <main>
    <rails-form method="post">
      <div class="form-field">
        <label>
          email
          <input type="email" name="email" required/>
        </label>
      </div>
      <div class="form-field">
        <label>
          password
          <input type="password" name="password" id="" required/>
        </label>
      </div>
      <button type="submit">login</button>
    </rails-form>
    <p>
      New user ?
      <a href="/users/new">signup</a>
    </p>
  </main>
</template>

<script>
export default {};
</script>

<style lang="postcss" scoped>
input {
  border: black solid 1px;
}

button {
  border: black solid 1px;
  background-color: lightgrey;
}
</style>
