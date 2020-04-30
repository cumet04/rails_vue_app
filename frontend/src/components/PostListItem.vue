<template>
  <div>
    <li class="contents">
      <a :href="`/posts/${post.id}`" class="title">
        {{ post.title }}
      </a>
      <div class="info">
        <span>
          by
          <a :href="`/users/${post.author.id}`">
            {{ post.author.email }}
          </a>
        </span>
        <span class="info_when">{{ when }}</span>
      </div>
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
};
</script>

<style lang="scss" scoped>
.contents {
  border-top: #ddd solid 1px;
  padding: 4px 8px;
}

.title {
  font-size: 1.8rem;
  display: block;
  margin: 0;
}

.info {
  font-size: 1.3rem;
  color: gray;

  &_when {
    margin-left: 0.5rem;
  }
}
</style>
