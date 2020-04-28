<template>
  <header>
    <div class="title">Application</div>
    <div class="spacer"></div>
    <div class="login">
      <template v-if="user">
        <div class="user_name">{{ user.email }}</div>
        <!-- TODO: POST or DELETE -->
        <a href="/logout"></a>
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
