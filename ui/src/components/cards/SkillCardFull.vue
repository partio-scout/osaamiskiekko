<script setup lang="ts">
// PURPLE SKILL CARD - FULL INFO
import { tr } from "../../composables/internationalization";
import { ref } from "vue";

const showFullText = ref(false);

const props = defineProps({
  card: { type: Object, required: true }
});
</script>

<template>
  <v-container>
    <v-card class="skill-card--no-hover">
      <v-row no-gutters>
        <v-col class="px-10 py-6" cols="12">
          <!-- ORGANIZATION -->
          <div class="text-subtitle-2 text-sm-body-2 dm-sans" v-if="props.card.organization">
            {{ props.card.organization }}
          </div>
          <!-- NAME -->
          <div
            style="line-height: 1.8rem"
            class="pt-3 text-h6 text-sm-h5 poppins"
            v-if="props.card.name.fi"
          >
            {{ props.card.name.fi }}
          </div>
          <!-- CREDITS -->
          <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("CREDITS") }}:</div>
          <div class="poppins" v-if="props.card.credits">{{ props.card.credits }}</div>
          <div class="poppins" v-else>-</div>
          <!-- DESCRIPTION -->
          <span v-if="props.card.description">
            <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("DESCRIPTION") }}:</div>
            <div
              style="white-space: pre-wrap"
              class="dm-sans hyphenate-break-5"
              v-if="props.card.description && !showFullText"
            >
              {{ props.card.description.fi }}
            </div>
            <div style="white-space: pre-wrap" class="dm-sans" v-else>
              {{ props.card.description.fi }}
            </div>
            <!-- SHOW MORE/LESS -->
            <button
              class="pt-1 text-subtitle-2 dm-sans"
              style="text-decoration: underline"
              v-if="props.card.description"
              @click="showFullText = !showFullText"
            >
              {{ showFullText ? tr("SHOW_LESS") : tr("SHOW_MORE") }}
            </button>
          </span>
          <!-- LINK -->
          <div class="pt-6 text-subtitle-2 dm-sans">{{ tr("READ_MORE") }}:</div>
          <div class="pb-10" v-if="props.card.url">
            <a class="poppins" :href="props.card.url" target="_blank">{{ tr("LINK") }}</a>
            <span class="text-subtitle-2 dm-sans"> ({{ tr("REDIRECT") }})</span>
          </div>
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>

<style scoped>
@import url("../../assets/styles.css");
</style>
