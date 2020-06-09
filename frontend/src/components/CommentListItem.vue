<template>
  <div>
    <li class="contents">
      <div class="info">
        by
        <a
          :href="`/users/${comment.author.id}`"
          v-if="comment.author.id != null"
        >
          {{ comment.author.name }}
        </a>
        <template v-else>
          {{ comment.author.name }}
        </template>
        <span class="when">{{ when }}</span>
      </div>
      <div class="content">
        {{ comment.content }}
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
  props: ["comment"],
  computed: {
    when() {
      return timeago.format(Date.parse(this.comment.createdAt));
    },
  },
  methods: {
    likeIco() {
      return this.imageUrl(
        this.comment.isLiked ? "ico-like_filled.svg" : "ico-like.svg"
      );
    },
    likeAction() {
      this.$axios
        .request({
          url: "/users/current/likes/comments/" + this.comment.id,
          method: this.comment.isLiked ? "delete" : "post",
        })
        .then(() => (this.comment.isLiked = !this.comment.isLiked));
    },
  },
};
</script>

<style lang="postcss" scoped>
.contents {
  border-top: #ddd solid 1px;
  padding: 8px;
  padding-right: 28px;
  position: relative;
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
