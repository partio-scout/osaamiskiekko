<script setup lang="ts">
// TURQUOISE DEGREE CARD - FULL INFO
import { tr } from "../../composables/internationalization";
import { ref } from "vue";

const showFullText = ref(false);

// Define card style
const cardClass = () => {
  if (
    props.card.level.fi === tr("GRADUATE_DEGREE") ||
    props.card.level.fi === tr("MASTERS_DEGREE") ||
    props.card.level.fi === "AMK" ||
    props.card.level.fi === "Ylempi AMK"
  ) {
    return "degree-card--no-hover yellow--no-hover";
  }
  return "degree-card--no-hover";
};

const props = defineProps({
  card: { type: Object, required: true }
});
</script>

<template>
  <v-container>
    <v-card :class="cardClass()">
      <v-row no-gutters>
        <v-col class="px-10 py-6" cols="12">
          <!-- FIELD -->
          <div class="text-subtitle-2 text-sm-body-2 dm-sans" v-if="props.card.field.fi">
            {{ props.card.field.fi.toUpperCase() }}
          </div>
          <!-- NAME -->
          <div style="line-height: 1.8rem" class="pt-3 text-h6 text-sm-h5 poppins">
            {{ props.card.name.fi }}
          </div>
          <!-- LEVEL -->
          <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("EDUCATION_TYPE") }}:</div>
          <div class="poppins" v-if="props.card.level.fi">
            {{ props.card.level.fi }}
          </div>
          <div class="poppins" v-else>-</div>
          <!-- DEGREE -->
          <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("DEGREE") }}:</div>
          <div class="poppins" v-if="props.card.degrees.fi.length">
            <div v-for="(degree, index) in props.card.degrees.fi" :key="index">
              {{ degree.toLowerCase() }}
            </div>
          </div>
          <div class="poppins" v-else>-</div>
          <!-- ORGANIZATIONS -->
          <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("ORGANIZATIONS") }}:</div>
          <div class="poppins" v-if="props.card.organizations.length > 0">
            <div v-for="(organization, index) in props.card.organizations" :key="index">
              {{ organization.charAt(0).toUpperCase() + organization.slice(1).toLowerCase() }}
            </div>
          </div>
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
          <!-- CREDITS -->
          <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("CREDITS") }}:</div>
          <div class="poppins" v-if="props.card.credits">{{ props.card.credits }}</div>
          <div class="poppins" v-else>-</div>
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
