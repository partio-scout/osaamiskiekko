<template>
  <div id="layout">
    <div class="layout-top">
      <navigation />
      <Nuxt />
    </div>

    <div class="layout-bottom">
      <main-footer />
    </div>
  </div>
</template>

<script>
export default {
  head () {
    return {
      htmlAttrs: {
        lang: this.$config.site && this.$config.site.localeId.substr(0, 2)
      }
    }
  }
}
</script>

<style lang="scss">
@import "../assets/scss/_typography";
@import "../assets/scss/_buttons";
@import "../assets/scss/_cookie-consent";

.line-break {
  height: 2px;

  border: 1px solid #ccc;

  margin: 1.5rem 0;

  cursor: default !important;

  list-style: none;
}

.blur-text {
  color: rgba($color: $body-color, $alpha: 0.8);
}

.blur-link {
  opacity: 0.6;
}

.page-section {
  .sub-heading {
    font-size: 1rem;
    font-weight: $sub-heading-font-weight;
    font-family: $body-font-family;
  }
}

html,
body,
#__nuxt,
#__layout,
#layout {
  height: 100%;

  scroll-behavior: smooth;
}

#layout {
  display: flex;
  flex-direction: column;

  .layout-top {
    flex-grow: 1;

    background: $background;

    .page-container {
      width: $content-width;
      max-width: 90vw;

      margin: 3rem auto 6rem auto;
    }
  }
}
</style>
