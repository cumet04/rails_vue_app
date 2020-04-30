<template>
  <main>
    <article class="article">
      <header class="header">
        <h1 class="title">{{ post.title }}</h1>
        <div class="info">
          <span class="info_author">
            by
            <a :href="`/users/${post.author.id}`" class="author_name">
              {{ post.author.email }}
            </a>
          </span>
          <span class="info_published_at">
            published at {{ publishedAt }}
          </span>
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
  margin-bottom: 20px;
}

.title {
  font-size: 3rem;
}

.info {
  font-size: 1.4rem;
  color: gray;

  .author_name {
    color: inherit;
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }

  &_published_at {
    margin-left: 0.5rem;
  }
}
</style>
