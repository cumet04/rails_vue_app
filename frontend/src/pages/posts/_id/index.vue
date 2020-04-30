<template>
  <main>
    <article class="article">
      <header class="header">
        <div class="header_content">
          <h1 class="title">{{ post.title }}</h1>
          <div class="info">
            <div>
              by
              <a :href="`/users/${post.author.id}`">
                {{ post.author.email }}
              </a>
              , published at {{ publishedAt }}
            </div>
            <div class="edit_link" v-if="isMyPost">
              <a :href="`/posts/${post.id}/edit`">edit</a>
            </div>
          </div>
        </div>
      </header>
      <section>
        {{ props.post.content }}
      </section>
    </article>
  </main>
</template>

<script>
export default {
  props: ["props"],
  computed: {
    post() {
      return this.props.post;
    },
    isMyPost() {
      return this.post.author.id == this.props.currentUser.id;
    },
    publishedAt() {
      return new Date(Date.parse(this.post.createdAt)).toLocaleDateString();
    },
  },
};
</script>

<style lang="scss" scoped>
.article {
  background-color: white;
  padding: 10px;
}

.header {
  display: flex;
  margin-bottom: 20px;

  &_content {
    flex-grow: 1;
  }
}

.title {
  font-size: 3rem;
}

.info {
  display: flex;
  justify-content: space-between;
  font-size: 1.4rem;
  color: gray;
}
</style>
