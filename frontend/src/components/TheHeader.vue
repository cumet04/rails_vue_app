<template>
  <header>
    <div class="title">Application</div>
    <div class="spacer"></div>
    <div class="login">
      <template v-if="user">
        <div class="user_name">login: {{ user.email }}</div>
        <form action="logout" method="post">
          <csrf-token-input></csrf-token-input>
          <input type="hidden" name="_method" value="delete" />
          <button type="submit">logout</button>
        </form>
        <form :action="`users/${user.id}`" method="post">
          <csrf-token-input></csrf-token-input>
          <input type="hidden" name="_method" value="delete" />
          <button type="submit">unregister</button>
        </form>
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
