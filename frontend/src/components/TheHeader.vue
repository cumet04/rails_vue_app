<template>
  <header>
    <div class="title">
      <a href="/">Application</a>
    </div>
    <div class="spacer"></div>
    <div class="account">
      <template v-if="user">
        <div class="user" @click="menuOpen">
          <img class="icon" :src="imageUrl('ico-account.svg')" alt="account" />
          <div class="user_name">
            {{ user.name }}
          </div>
        </div>
        <div class="menu" v-if="isMenuOpen">
          <ul class="menu_list">
            <li class="menu_item">
              <a href="/users/current">my profile</a>
            </li>
            <li>
              <rails-form :action="`users/current`" method="delete">
                <button type="submit">unregister</button>
              </rails-form>
            </li>
            <li>
              <rails-form action="/logout" method="delete">
                <button type="submit">logout</button>
              </rails-form>
            </li>
          </ul>
        </div>
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
  data: () => ({
    isMenuOpen: false,
    _removeEvent: null,
  }),
  methods: {
    menuOpen() {
      this.isMenuOpen = !this.isMenuOpen;

      const closeFunc = function (e) {
        if (!this.$el.contains(e.target)) {
          this.isMenuOpen = false;
          this._removeEvent();
        }
      }.bind(this);
      window.addEventListener("click", closeFunc);
      this._removeEvent = () => {
        window.removeEventListener("click", closeFunc);
      };
    },
  },
};
</script>

<style lang="postcss" scoped>
header {
  display: flex;
  background-color: lightblue;
  padding: 8px;
}

.spacer {
  flex-grow: 1;
}

.account {
  position: relative;

  & .menu {
    position: absolute;
    right: 0;
    border: gray solid 1px;
    background-color: white;
    padding: 5px;
  }
}

.user {
  display: flex;
  cursor: pointer;

  & .icon {
    width: 20px;
    height: 20px;
    margin-right: 5px;
  }
}
</style>
