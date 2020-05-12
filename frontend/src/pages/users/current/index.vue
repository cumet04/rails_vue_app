<template>
  <main class="main">
    <section class="profile section">
      <h2>{{ props.user.name }}</h2>
      <ul class="attributes block">
        <li class="item">
          {{ props.user.email }}
        </li>
      </ul>
      <div class="biography block">
        <h3 class="header">Biography</h3>
        <p>{{ props.user.biography }}</p>
      </div>
      <div class="edit block">
        <a href="/users/current/edit" class="link">edit profile</a>
      </div>
    </section>
    <div class="spacer"></div>
    <div class="contents">
      <section class="posts section">
        <h2>All posts</h2>
        <ol class="posts_list">
          <post-list-item
            v-for="post in props.posts"
            :key="post.id"
            :post="post"
          >
          </post-list-item>
        </ol>
      </section>
    </div>
  </main>
</template>

<script>
import PostListItem from "/src/components/PostListItem.vue";

export default {
  props: ["props"],
  components: {
    "post-list-item": PostListItem,
  },
};
</script>

<style lang="postcss" scoped>
.main {
  display: flex;
}

.section {
  background-color: white;
  padding: 10px;
}

.profile {
  width: 280px;

  & .block {
    &:not(:last-child) {
      margin-bottom: 10px;
    }
  }

  & .attributes {
    & .item {
      display: flex;

      &::before {
        display: block;
        content: "\0b7"; /* &middot */
        width: 1rem;
      }
    }
  }

  & .biography {
    & .header {
      font-size: 1.6rem;
    }
  }

  & .edit {
    display: flex;
    justify-content: flex-end;

    & .link {
      color: gray;
      font-size: 1.4rem;
    }
  }
}

.spacer {
  width: 20px;
}

.contents {
  flex-grow: 1;
}
</style>
