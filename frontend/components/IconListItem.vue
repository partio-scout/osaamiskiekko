<template>
  <div class="d-flex icon-list-item">
    <div class="left">
      <i :class="cssClass" />
    </div>

    <div class="right pl-3">
      <h5>{{ heading }}</h5>

      <p>{{ text }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: ['heading', 'text', 'icon'],

  computed: {
    cssClass () {
      return 'fas ' + this.icon
    }
  }
}
</script>

<style lang="scss" scoped>
.icon-list-item {
  .right {
    h5 {
      font-weight: bold;
      font-size: 0.9rem;
    }

    p {
      line-height: 1.2;
    }
  }
}
</style>
