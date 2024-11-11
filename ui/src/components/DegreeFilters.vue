<script setup lang="ts">
import { tr } from "../composables/internationalization";
import useSearchStore from "../store/search";

const searchStore = useSearchStore();
</script>

<template>
  <v-row dense>
    <!-- HEADING -->
    <v-col cols="12">
      <div class="mb-7 text-h6 poppins-white">
        {{ tr("DEGREE_VIEW_SEARCH_TITLE") }}
      </div>
      <!-- SEARCH FIELD -->
      <v-text-field v-model="searchStore.searchQueryDegree" bg-color="h1" variant="solo">
        <template v-slot:label>
          <span style="font-size: 120%; color: black">{{ tr("SEARCH") }}</span>
        </template>
      </v-text-field>
    </v-col>
    <!-- HEADING -->
    <v-col cols="12">
      <div class="mb-7 text-h6 poppins-white">
        {{ tr("DEGREE_VIEW_FILTERS_TITLE") }}
      </div>
      <!-- FILTER DROPDOWN MENU 1 -->
      <v-select
        chips
        closable-chips
        v-model="searchStore.degreeFieldSelections"
        :label="tr('DEGREE_VIEW_FILTERS_PLACEHOLDER_1')"
        :items="searchStore.degreeFields"
        multiple
        variant="solo"
        bg-color="h1"
      >
        <template v-slot:label>
          <span style="font-size: 120%; color: black">{{
            tr("DEGREE_VIEW_FILTERS_PLACEHOLDER_1")
          }}</span>
        </template></v-select
      >
      <!-- FILTER DROPDOWN MENU 2 -->
      <v-select
        chips
        closable-chips
        v-model="searchStore.degreeLevelSelections"
        :items="searchStore.degreeLevels"
        multiple
        variant="solo"
        bg-color="h1"
      >
        <template v-slot:label>
          <span style="font-size: 120%; color: black">{{
            tr("DEGREE_VIEW_FILTERS_PLACEHOLDER_2")
          }}</span>
        </template></v-select
      >
    </v-col>
  </v-row>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
