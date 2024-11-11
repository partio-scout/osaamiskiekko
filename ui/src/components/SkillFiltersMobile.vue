<script setup lang="ts">
import { tr } from "../composables/internationalization";
import useApiStore from "../store/api";
import useSearchStore from "../store/search";

const apiStore = useApiStore();
const searchStore = useSearchStore();
</script>

<template>
  <v-row dense>
    <!-- HEADING -->
    <v-col cols="12">
      <div class="mb-7 text-sm-h6 poppins-white">
        {{ tr("SKILL_VIEW_SEARCH_TITLE") }}
      </div>
      <!-- SEARCH FIELD -->
      <v-text-field
        density="compact"
        v-model="searchStore.searchQuerySkill"
        bg-color="h1"
        :label="tr('SEARCH')"
        variant="solo"
      ></v-text-field>
    </v-col>
  </v-row>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
