<template>
  <main>
    <h1>micro posts</h1>
    <div class="container">
      <article class="article">
        <div class="posts">
          <h2>Latest Posts</h2>
          <ol>
            <post-list-item
              v-for="post in props.posts"
              :post="post"
              :key="post.id"
            >
            </post-list-item>
          </ol>
        </div>
      </article>
      <div class="spacer"></div>
      <aside class="aside">
        <div class="users">
          <h2>Users</h2>
          <ol>
            <user-list-item
              v-for="user in props.users"
              :user="user"
              :key="user.id"
            >
            </user-list-item>
          </ol>
        </div>
      </aside>
    </div>
  </main>
</template>

<script>
import PostListItem from "~/components/PostListItem";
import UserListItem from "~/components/UserListItem";

export default {
  props: ["props"],
  components: {
    "post-list-item": PostListItem,
    "user-list-item": UserListItem,
  },
};
</script>

<style lang="postcss" scoped>
.container {
  display: flex;
}

.spacer {
  width: 20px;
}

.article {
  flex-grow: 1;
}

.posts {
  background-color: white;
  padding: 10px;
}

.users {
  min-width: 200px;
  background-color: white;
  padding: 10px;
}
</style>
