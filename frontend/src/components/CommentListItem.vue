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
      <like-button :targetType="'comment'" :target="comment"></like-button>
    </li>
  </div>
</template>

<script>
import * as timeago from "timeago.js";
import LikeButton from "~/components/LikeButton";

export default {
  props: ["comment"],
  components: {
    "like-button": LikeButton,
  },
  computed: {
    when() {
      return timeago.format(Date.parse(this.comment.createdAt));
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

.info {
  font-size: 1.3rem;
  color: gray;

  & .when {
    margin-left: 0.5rem;
  }
}
</style>
