<template>
  <page-section
    image-alt="Duunikoutsi"
    class="part4"
    img-url="/images/duunikoutsi-new.png"
  >
    <h2>{{ heading }}</h2>

    <p class="blur-text">
      {{ text }}
    </p>

    <div class="download-imgs">
      <div>
        <a
          aria-label="xxxMartinxxx - Go to Google Play store"
          target="_blank"
          href="https://play.google.com/store/apps/details?id=fi.tat.duunikoutsi&hl=fi"
        >
          <img src="/images/google-play-badge.png" alt="">
        </a>
      </div>

      <div>
        <a
          aria-label="xxxMartinxxx - Go to Apple app store"
          target="_blank"
          href="https://apps.apple.com/fi/app/duunikoutsi/id1462903853"
        >
          <img
            src="/images/Download_on_the_App_Store_Badge_US-UK_RGB_blk_092917.svg"
            alt=""
          >
        </a>
      </div>
    </div>
  </page-section>
</template>

<script>
export default {
  props: ['heading', 'text', 'imageAlt']
}
</script>

<style lang="scss" scoped>
.part4 {
  .download-imgs {
    display: flex;
    align-items: center;

    @include media-breakpoint-down(md) {
      justify-content: center;
    }

    & > div {
      width: 10rem;

      img {
        max-width: 100%;
      }
    }
  }
}
</style>
