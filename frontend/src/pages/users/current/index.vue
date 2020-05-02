<template>
  <main class="main">
    <section class="profile section">
      <h2>{{ props.user.name }}</h2>
      <ul class="profile_attributes profile_block">
        <li class="profile_attributes_item">
          {{ props.user.email }}
        </li>
      </ul>
      <div class="profile_biography profile_block">
        <h3 class="profile_biography_header">Biography</h3>
        <p>{{ props.user.biography }}</p>
      </div>
      <div class="profile_edit profile_block">
        <a href="/users/current/edit" class="profile_edit_link">edit profile</a>
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
import PostListItem from "~/components/PostListItem";

export default {
  props: ["props"],
  components: {
    "post-list-item": PostListItem,
  },
};
</script>

<style lang="scss" scoped>
.main {
  display: flex;
}

.section {
  background-color: white;
  padding: 10px;
}

.profile {
  width: 280px;

  &_block {
    &:not(:last-child) {
      margin-bottom: 10px;
    }
  }

  &_attributes {
    &_item {
      display: flex;

      &::before {
        display: block;
        content: "\0b7"; // &middot;
        width: 1rem;
      }
    }
  }

  &_biography_header {
    font-size: 1.6rem;
  }

  &_edit {
    display: flex;
    justify-content: flex-end;

    &_link {
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
