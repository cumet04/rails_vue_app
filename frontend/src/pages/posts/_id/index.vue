<template>
  <main>
    <article class="article">
      <header class="header">
        <div class="content">
          <h1 class="title">{{ post.title }}</h1>
          <div class="info">
            <div>
              by
              <a :href="`/users/${author.id}`" v-if="author.id != null">
                {{ author.name }}
              </a>
              <template v-else>
                {{ author.name }}
              </template>
              , published at {{ timestamp(post.createdAt) }}
            </div>
            <div class="edit_link" v-if="isMyPost">
              <a :href="`/posts/${post.id}/edit`">edit</a>
            </div>
          </div>
        </div>
      </header>
      <section>
        <template v-for="(line, i) in contentLines">
          <br v-if="line.match(/^\s*$/)" :key="i" />
          <p v-else :key="i">{{ line }}</p>
        </template>
      </section>
    </article>
    <div class="spacer"></div>
    <aside class="comments">
      <h2>comments</h2>
      <ol class="comments_list">
        <comment-list-item
          v-for="comment in comments"
          :key="comment.id"
          :comment="comment"
        ></comment-list-item>
      </ol>
    </aside>
  </main>
</template>

<script>
import CommentListItem from "~/components/CommentListItem";

export default {
  props: ["props"],
  components: {
    "comment-list-item": CommentListItem,
  },
  data() {
    return {
      // aliases
      post: this.props.post,
      author: this.props.post.author,
      comments: this.props.post.comments,
    };
  },
  computed: {
    isMyPost() {
      return this.author.id == this.props.currentUser.id;
    },
    contentLines() {
      return this.post.content.split("\n");
    },
  },
  methods: {
    timestamp(time) {
      return new Date(Date.parse(time)).toLocaleDateString();
    },
  },
};
</script>

<style lang="postcss" scoped>
.article {
  background-color: white;
  padding: 10px;

  & .header {
    display: flex;
    margin-bottom: 20px;

    & .content {
      flex-grow: 1;
    }
  }

  & .title {
    font-size: 3rem;
  }

  & .info {
    display: flex;
    justify-content: space-between;
    font-size: 1.4rem;
    color: gray;
  }
}

.spacer {
  height: 20px;
}

.comments {
  background-color: white;
  padding: 10px;
}
</style>
