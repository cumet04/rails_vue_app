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
        <span class="info_when">{{ when }}</span>
      </div>
      <div class="content">
        {{ comment.content }}
      </div>
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
};
</script>

<style lang="scss" scoped>
.contents {
  border-top: #ddd solid 1px;
  padding: 8px;
}

.info {
  font-size: 1.3rem;
  color: gray;

  &_when {
    margin-left: 0.5rem;
  }
}
</style>
