<template>
  <div>
    <button class="like" :class="disabled && 'disabled'" @click="action">
      <img class="icon" :src="icon" alt="like" />
      <div class="count" v-if="count">{{ count }}</div>
    </button>
  </div>
</template>

<script>
export default {
  props: ["targetType", "target"],
  computed: {
    disabled() {
      return !this.$appData.currentUser;
    },
    icon() {
      return this.imageUrl(
        this.target.isLiked ? "ico-like_filled.svg" : "ico-like.svg"
      );
    },
    count() {
      if (this.target.likedCount > 0) return this.target.likedCount;
      return null;
    },
  },
  methods: {
    action() {
      if (this.disabled) return;

      const dir = {
        post: "posts",
        comment: "comments",
      }[this.targetType];
      if (!dir) {
        console.error(
          `likeAction failed with invalid targetType: ${this.targetType}`
        );
        return;
      }

      this.$axios
        .request({
          url: `/users/current/likes/${dir}/${this.target.id}`,
          method: this.target.isLiked ? "delete" : "post",
        })
        .then((resp) => {
          if (resp.status == 201 || resp.status == 202) {
            this.target.isLiked = !this.target.isLiked;
            this.target.likedCount += this.target.isLiked ? 1 : -1;
          }
        })
        .catch((err) => {
          console.error("likeAction fetch failed:");
          console.error(resp);
        });
    },
  },
};
</script>

<style lang="postcss" scoped>
.like {
  position: absolute;
  top: 0;
  right: 8px;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  &.disabled {
    cursor: default;
  }

  &:focus {
    outline: none;
  }

  & .icon {
    width: 20px;
    height: 20px;
  }
}
</style>
