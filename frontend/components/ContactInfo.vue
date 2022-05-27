<template>
  <div class="contact-info">
    <h2>{{ itemData.name }}</h2>

    <p class="blur-text">
      {{ itemData.company }}
    </p>

    <a :href="mailToLink" class="blur-text">
      {{ itemData.email }}
    </a>

    <br>

    <a :href="phoneToLink" class="blur-text">
      {{ itemData.phone }}
    </a>
  </div>
</template>

<script>
export default {
  props: ['itemData'],

  computed: {
    mailToLink () {
      return 'mailto:' + this.itemData.email
    },
    phoneToLink () {
      return 'tel:' + this.itemData.phone
    }
  }
}
</script>

<style lang="scss" scoped>
.contact-info {
  h2 {
    font-size: 1.875rem;
    font-weight: 700;
    line-height: 2.125rem;
    color: $subheading-color;
  }

  p {
    line-height: 1.7;
    margin-bottom: unset;
  }

  a {
    line-height: 1.7;
    text-decoration: none;

    @include a-all-selectors {
      text-decoration: underline;
      color: unset;
    }
  }
}
</style>
