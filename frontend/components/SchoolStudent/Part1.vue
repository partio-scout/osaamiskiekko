<template>
  <page-section
    :image-alt="imageAlt"
    image-side="right"
    :img-url="imgUrl"
    :is-header="true"
  >
    <h1 class="mb-4">
      {{ heading }}
    </h1>
    <p class="blur-text">
      {{ text }}
    </p>
    <div class="button">
      <button class="btn" :class="btnClass" @click="$goTo('searchForm')">
        {{ buttonName }}
      </button>
    </div>
  </page-section>
</template>

<script>
export default {
  props: ['heading', 'text', 'buttonName', 'imgUrl', 'imageAlt', 'isStudent'],
  computed: {
    btnClass () {
      return this.isStudent ? 'btn-outlined-milan' : 'btn-outlined-mauve'
    }
  }
}
</script>

<style lang="scss" scoped>
.page-section {
  .button {
    margin-top: 3rem;

    button {
      @include media-breakpoint-down(xs) {
        width: 100%;
      }
    }
  }
}
</style>
