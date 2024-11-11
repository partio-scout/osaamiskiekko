<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { ref } from "vue";
import useSearchStore from "../store/search";

const searchStore = useSearchStore();

const showFilters = ref(false);
</script>

<template>
  <v-row dense>
    <!-- HEADING -->
    <v-col cols="12">
      <div class="mb-2 text-subtitle-2 poppins-white">
        {{ tr("DEGREE_VIEW_SEARCH_TITLE") }}
      </div>
      <!-- SEARCH FIELD -->
      <v-text-field
        density="compact"
        v-model="searchStore.searchQueryDegree"
        bg-color="h1"
        :label="tr('SEARCH')"
        variant="solo"
      >
      </v-text-field>
    </v-col>
    <!-- HEADING -->
    <v-col cols="12" v-if="showFilters">
      <div class="mb-2 text-subtitle-2 poppins-white">
        {{ tr("DEGREE_VIEW_FILTERS_TITLE") }}
      </div>
      <!-- FILTER DROPDOWN MENU 1 -->
      <v-select
        chips
        closable-chips
        density="compact"
        v-model="searchStore.degreeFieldSelections"
        :label="tr('DEGREE_VIEW_FILTERS_PLACEHOLDER_1')"
        :items="searchStore.degreeFields"
        multiple
        variant="solo"
        bg-color="h1"
      ></v-select>
      <!-- FILTER DROPDOWN MENU 2 -->
      <v-select
        chips
        closable-chips
        density="compact"
        v-model="searchStore.degreeLevelSelections"
        :label="tr('DEGREE_VIEW_FILTERS_PLACEHOLDER_2')"
        :items="searchStore.degreeLevels"
        multiple
        variant="solo"
        bg-color="h1"
      ></v-select>
    </v-col>

    <!-- SHOW / HIDE FILTERS-->
    <v-col cols="12" class="text-center pt-0 pb-4">
      <v-btn
        alt="{{ tr('SHOW_OR_HIDE_FILTERS') }}"
        variant="plain"
        color="transparent"
        @click="showFilters = !showFilters"
      >
        <div class="text-subtitle-2 poppins-white">
          {{ showFilters ? tr("HIDE_FILTERS") : tr("SHOW_FILTERS") }}
        </div>
        <div>
          <v-icon color="h2h3" size="x-large">{{
            showFilters ? "keyboard_arrow_up" : "keyboard_arrow_down"
          }}</v-icon>
        </div>
      </v-btn>
    </v-col>
  </v-row>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
