<template>
  <div class="school-student">
    <slot />
  </div>
</template>

<style lang="scss" scoped>
.school-student {
  background: $background;

  @include media-breakpoint-down(md) {
    text-align: center;
  }
}
</style>
