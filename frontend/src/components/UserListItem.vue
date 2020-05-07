<template>
  <div>
    <li class="contents">
      <a :href="`/users/${user.id}`" class="name">
        {{ user.name }}
      </a>
    </li>
  </div>
</template>

<script>
export default {
  props: ["user"],
};
</script>

<style lang="postcss" scoped>
.contents {
  border-top: #ddd solid 1px;
  padding: 4px 8px;
}

.name {
  font-size: 1.6rem;
  display: block;
  margin: 0;
  color: inherit;
  text-decoration: none;

  &:hover {
    text-decoration: underline;
  }
}
</style>
