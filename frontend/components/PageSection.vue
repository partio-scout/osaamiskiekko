<template>
  <div
    class="page-section"
    :class="{
      'right-img-layout': isImgRight,
      'align-items-center': isHeader
    }"
  >
    <div class="left">
      <img :src="imgUrl" :alt="imageAlt">

      <div class="shadow-img" :class="{ 'shadow-img-header': isHeader }" />
    </div>

    <div class="right">
      <div>
        <slot />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    imgUrl: {
      type: String,
      default: ''
    },

    imageSide: {
      type: String,
      default: ''
    },
    imageAlt: {
      type: String,
      default: ''
    },

    isHeader: {
      type: Boolean,
      required: false,
      default: false
    }
  },

  computed: {
    isImgRight () {
      return this.imageSide === 'right'
    }
  }
}
</script>

<style lang="scss" scoped>
.page-section {
  display: flex;

  margin: 0 auto;

  max-width: $content-width;

  background: $background;

  @include media-breakpoint-down(md) {
    flex-direction: column;
  }

  .left {
    width: 50%;

    position: relative;

    overflow: hidden;

    @include media-breakpoint-down(md) {
      width: 100%;
    }

    .shadow-img-header {
      box-shadow: inset 3rem 4rem 4rem 0 rgb(0 0 0 / 60%) !important;
    }

    .shadow-img {
      position: absolute;
      top: 0;
      left: 0;

      width: 100%;
      height: 100%;

      box-shadow: inset -3rem 0 4rem 0 rgb(0 0 0 / 60%);
    }

    img {
      max-width: 100%;
      min-height: 100%;
      height: unset;

      object-fit: cover;
    }
  }

  .right {
    width: 50%;

    @include media-breakpoint-down(md) {
      width: 100%;
    }

    & > div {
      padding: 7rem 3rem;

      h2,
      h3 {
        margin-bottom: 1rem;
      }

      h2 {
        font-size: 1.7rem;
      }

      h3 {
        font-size: 1rem;
      }
    }
  }

  &.right-img-layout {
    flex-direction: row-reverse;

    @include media-breakpoint-down(md) {
      flex-direction: column;
    }

    .left {
      .shadow-img {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        box-shadow: inset 3rem 0 4rem 0 rgb(0 0 0 / 60%);
      }
    }
  }
}
</style>
