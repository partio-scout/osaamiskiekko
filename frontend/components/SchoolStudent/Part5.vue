<template>
  <page-section :image-alt="imageAlt" :img-url="imgUrl" image-side="right">
    <navigation-links-box :is-student-page="isStudent" />
  </page-section>
</template>

<script>
export default {
  props: ['imgUrl', 'isStudent', 'imageAlt']
}
</script>
