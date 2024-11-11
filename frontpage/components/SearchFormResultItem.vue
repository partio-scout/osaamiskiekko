<template>
  <div class="search-form-result-item">
    <div v-if="itemData.type === 'heading'" class="heading">
      <h5>{{ itemData.text }} ({{ itemData.data.length }})</h5>
    </div>

    <ul>
      <li
        v-for="searchData in itemData.data"
        :key="searchData.id"
        class="link-item"
        @click="onGoToDetails(searchData.id)"
      >
        <p v-if="searchData.type === 'competence-link'">
          {{ searchData.text }}
        </p>

        <div v-else-if="searchData.type === 'academic-link'">
          <b>{{ searchData.text }}</b>

          <p>{{ searchData.subText }}</p>
        </div>
      </li>
    </ul>

    <div class="line-break" />
  </div>
</template>

<script>
export default {
  props: ['itemData'],

  methods: {
    onGoToDetails (id) {
      this.$router.push('/' + this.$config.siteId + '/details/' + id)
    }
  }
}
</script>

<style lang="scss" scoped>
.search-form-result-item {
  .heading {
    font-weight: 700;

    margin-bottom: 1.5rem;
  }

  ul {
    padding-left: 0;

    .link-item {
      cursor: pointer;

      list-style: none;

      font-weight: 400;

      p {
        text-shadow: unset !important;
      }

      @include a-all-selectors {
        background: #ccc;
      }
    }
  }
}
</style>
