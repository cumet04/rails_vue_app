<template>
  <header>
    <div class="title">Application</div>
    <div class="spacer"></div>
    <div class="login">
      <template v-if="user">
        <div class="user">
          <img
            class="user_icon"
            :src="imageUrl('ico-account.svg')"
            alt="account"
          />
          {{ user.name }}
        </div>
        <rails-form action="/logout" method="delete">
          <button type="submit">logout</button>
        </rails-form>
        <rails-form :action="`users/current`" method="delete">
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
  padding: 8px;
}

.spacer {
  flex-grow: 1;
}

.user_icon {
  width: 20px;
  height: 20px;
}
</style>
