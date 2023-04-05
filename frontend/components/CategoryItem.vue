<template>
  <div :style="cssStyle" class="category-item">
    <nuxt-link :to="itemData.link">
      <div class="avatar">
        <img :src="itemData.imgUrl" alt="">
      </div>

      <h3>
        {{ itemData.title }}
      </h3>

      <p v-show="!isHidden" class="blur-text">
        {{ itemData.content }}
      </p>
    </nuxt-link>
  </div>
</template>

<script>
export default {
  props: ['itemData'],

  data () {
    return {
      isHidden: true
    }
  },

  computed: {
    cssStyle () {
      return {
        '--hover-color': this.itemData.hoverColor
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.category-item {
  background: inherit;

  text-align: center;

  width: 100%;

  padding: 1rem 4rem 0 3rem;

  a {
    text-decoration: none;
    color: inherit;

    &:hover {
      color: var(--hover-color);
    }

    .avatar {
      width: 60%;

      margin: 0 auto;

      @include media-breakpoint-down(md) {
        width: 40%;
      }

      img {
        max-width: 100%;
      }
    }

    h3 {
      margin: 0.6rem 0 1.2rem 0;

      font-size: 1.5rem; // was 1.125
      font-family: $heading-font-family;
      font-weight: 700;

      @include media-breakpoint-down(md) {
        font-size: 1.9rem;
      }
    }

    p {
      font-size: 0.875rem;
      line-height: 1.375rem;
      color: $menu-link;

      @include media-breakpoint-down(md) {
        font-size: 1rem;
      }
    }
  }
}
</style>
