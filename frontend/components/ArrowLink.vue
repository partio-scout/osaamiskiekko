<template>
  <div class="arrow-link d-flex">
    <div class="left">
      <!-- is-right-arrow: arrow pointing right -->
      <div v-show="!isDegreePage" :class="{ 'not-degree-page': !isDegreePage }">
        <i class="fas fa-arrow-right" />
      </div>

      <!-- is-down-arrow: arrow pointing down -->
      <div v-show="isDegreePage" :class="{ 'degree-page': isDegreePage }">
        <i class="fas fa-arrow-right" />
        <i class="fas fa-arrow-down" />
      </div>
    </div>

    <div class="right">
      <nuxt-link v-if="!isExternalLink" :to="to">
        <slot />
      </nuxt-link>

      <a v-else target="_blank" :href="to"><slot /></a>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    to: {
      type: String,
      default: ''
    },

    // Check if a link is an external link
    isExternalLink: {
      type: Boolean
    },

    isDegreePage: {
      type: Boolean,
      default: false,
      required: false
    }
  }
}
</script>

<style lang="scss" scoped>
.arrow-link {
  margin-bottom: 1rem;

  .left {
    align-self: center;

    .not-degree-page {
      .fa-arrow-right {
        display: inline-block;
      }
    }

    .degree-page {
      .fa-arrow-right {
        display: inline-block;
      }

      .fa-arrow-down {
        display: none;
      }

      @include media-breakpoint-down(lg) {
        .fa-arrow-right {
          display: none;
        }

        .fa-arrow-down {
          display: inline-block;
        }
      }
    }

    i {
      margin-right: 0.5rem;
      color: inherit;
    }
  }

  .right {
    a {
      text-decoration: none;
      color: inherit;
      font-weight: 600;
      font-family: $heading-font-family;

      @include media-breakpoint-down(sm) {
        font-size: 1.2rem !important;
      }

      @include media-breakpoint-down(xs) {
        font-size: 1rem !important;
      }
    }
  }
}
</style>
