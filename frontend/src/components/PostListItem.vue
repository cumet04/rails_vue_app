<template>
  <div>
    <li class="contents">
      <a :href="`/posts/${post.id}`" class="title">
        {{ post.title }}
      </a>
      <div class="info">
        <span>
          by
          <a :href="`/users/${post.author.id}`" v-if="post.author.id != null">
            {{ post.author.name }}
          </a>
          <template v-else>
            {{ post.author.name }}
          </template>
        </span>
        <span class="when">{{ when }}</span>
      </div>
      <button class="like" @click="likeAction">
        <img class="icon" :src="likeIco()" alt="like" />
      </button>
    </li>
  </div>
</template>

<script>
import * as timeago from "timeago.js";

export default {
  props: ["post"],
  computed: {
    when() {
      return timeago.format(Date.parse(this.post.createdAt));
    },
  },
  methods: {
    likeIco() {
      return this.imageUrl(
        this.post.isLiked ? "ico-like_filled.svg" : "ico-like.svg"
      );
    },
    likeAction() {
      this.$axios
        .request({
          url: "/users/current/likes/posts/" + this.post.id,
          method: this.post.isLiked ? "delete" : "post",
        })
        .then(() => (this.post.isLiked = !this.post.isLiked));
    },
  },
};
</script>

<style lang="postcss" scoped>
.contents {
  border-top: #ddd solid 1px;
  padding: 4px 8px;
  padding-right: 28px;
  position: relative;
}

.title {
  font-size: 1.8rem;
  display: block;
  margin: 0;
}

.like {
  position: absolute;
  top: 0;
  right: 8px;
  height: 100%;
  display: flex;
  align-items: center;
  &:focus {
    outline: none;
  }

  & .icon {
    width: 20px;
    height: 20px;
  }
}

.info {
  font-size: 1.3rem;
  color: gray;

  & .when {
    margin-left: 0.5rem;
  }
}
</style>
