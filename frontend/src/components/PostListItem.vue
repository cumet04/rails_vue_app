<template>
  <div>
    <li class="contents">
      <a :href="`/posts/${post.id}`" class="title">
        {{ post.title }}
      </a>
      <small class="info">
        <span class="info_author">
          by
          <a :href="`/users/${post.author.id}`" class="author_name">
            {{ post.author.email }}
          </a>
        </span>
        <span class="info_when">{{ when }}</span>
      </small>
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
  color: inherit;
  text-decoration: none;

  &:hover {
    text-decoration: underline;
  }
}

.info {
  display: block;
  color: gray;

  .author_name {
    color: inherit;
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }

  &_when {
    margin-left: 0.5rem;
  }
}
</style>
