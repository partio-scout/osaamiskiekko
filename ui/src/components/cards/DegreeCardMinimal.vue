<script setup lang="ts">
// PURPLE SKILL CARD - MINIMAL INFO
import { tr } from "../../composables/internationalization";
import useApiStore from "../../store/api";

const apiStore = useApiStore();

// Define card style
const cardClass = () => {
  if (
    props.card.level.fi === tr("GRADUATE_DEGREE") ||
    props.card.level.fi === tr("MASTERS_DEGREE") ||
    props.card.level.fi === "AMK" ||
    props.card.level.fi === "Ylempi AMK"
  ) {
    return "degree-card yellow";
  }
  return "degree-card";
};

const props = defineProps({
  card: { type: Object, required: true },
  urlFrom: { type: String, required: true }
});
</script>

<template>
  <v-container class="px-0 pa-sm-3">
    <v-card
      class="pt-5 pb-10"
      :class="cardClass()"
      :to="`/skills/${props.urlFrom}/${props.card.id}`"
    >
      <v-row no-gutters>
        <v-col cols="12">
          <!-- LEVEL -->
          <div class="px-6 text-subtitle-2 text-sm-body-2 dm-sans hyphenate-break-2">
            {{ props.card.level.fi }}
          </div>
          <!-- NAME -->
          <div
            style="line-height: 1.8rem"
            class="pt-3 px-6 text-h6 text-sm-h5 poppins hyphenate-break-2"
          >
            {{ props.card.name.fi }}
          </div>
          <!-- CREDITS -->
          <div class="pt-3 px-6 text-subtitle-2 dm-sans">{{ tr("CREDITS") }}:</div>
          <div class="px-6 poppins" v-if="props.card.credits">{{ props.card.credits }}</div>
          <div class="px-6 poppins" v-else>-</div>
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>

<style scoped>
@import url("../../assets/styles.css");
</style>
