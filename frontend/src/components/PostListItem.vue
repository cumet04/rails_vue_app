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
      <like-button :targetType="'post'" :target="post"></like-button>
    </li>
  </div>
</template>

<script>
import * as timeago from "timeago.js";
import LikeButton from "~/components/LikeButton";

export default {
  props: ["post"],
  components: {
    "like-button": LikeButton,
  },
  computed: {
    when() {
      return timeago.format(Date.parse(this.post.createdAt));
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

.info {
  font-size: 1.3rem;
  color: gray;

  & .when {
    margin-left: 0.5rem;
  }
}
</style>
