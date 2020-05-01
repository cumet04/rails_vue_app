<template>
  <header>
    <div class="title">Application</div>
    <div class="spacer"></div>
    <div class="login">
      <template v-if="user">
        <div class="user_name">login: {{ user.name }}</div>
        <rails-form action="/logout" method="delete">
          <button type="submit">logout</button>
        </rails-form>
        <rails-form :action="`users/${user.id}`" method="delete">
          <button type="submit">unregister</button>
        </rails-form>
      </template>
      <template v-else>
        <a href="/login">login</a>
      </template>
    </div>
  </header>
</template>

<script>
export default {
  props: ["user"],
};
</script>

<style lang="scss" scoped>
header {
  display: flex;
  background-color: lightblue;
}

.spacer {
  flex-grow: 1;
}
</style>
