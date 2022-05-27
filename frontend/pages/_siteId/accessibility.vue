<template>
  <div class="accessibility">
    <div class="page-container" v-html="content.contentText" />
  </div>
</template>

<script>
export default {
  async asyncData ({ $content, $config: { siteId } }) {
    const content = await $content(
      'accessibility/accessibility-' + siteId
    ).fetch()
    return {
      content
    }
  },

  head () {
    return {
      title: this.$root.context.app.head.title + ' | ' + this.content.title
    }
  }
}
</script>

<style lang="scss" scoped>
.accessibility {
  .page-container {
    max-width: 55vw !important;

    ::v-deep h1 {
      margin-bottom: 4rem;

      text-align: center;
    }

    ::v-deep h2 {
      font-size: 1.7rem;

      margin-top: 2rem;
    }
  }
}
</style>
