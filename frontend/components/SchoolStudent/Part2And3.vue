<template>
  <!-- This is for part 2 and part 3 -->
  <page-section :image-alt="imageAlt" :image-side="imageSide" :img-url="imgUrl">
    <h2>
      <p class="sub-heading" :style="subHeadingStyle">
        {{ subHeading }}
      </p>
      {{ heading }}
    </h2>
    <p class="blur-text">
      {{ text }}
    </p>
  </page-section>
</template>

<script>
export default {
  props: [
    'imgUrl',
    'imageAlt',
    'subHeading',
    'heading',
    'text',
    'isStudent',
    'imageSide'
  ],
  computed: {
    subHeadingStyle () {
      if (!this.isStudent) {
        return {
          color:
            process.client &&
            window
              // Retrieve css variable
              .getComputedStyle(document.documentElement)
              .getPropertyValue('--mauve-color')
        }
      } else {
        return {
          color:
            process.client &&
            window
              // Retrieve css variable
              .getComputedStyle(document.documentElement)
              .getPropertyValue('--milan-color')
        }
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
