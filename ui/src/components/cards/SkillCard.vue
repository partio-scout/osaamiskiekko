<script setup lang="ts">
// TURQUOISE DEGREE CARD
import { tr } from "../../composables/internationalization";
import useApiStore from "../../store/api";

const apiStore = useApiStore();

const props = defineProps({
  card: { type: Object, required: true }
});
</script>

<template>
  <v-container class="px-0 pa-sm-3">
    <v-card class="skill-card" :to="`skills/${card.id}`">
      <v-row no-gutters>
        <v-col class="px-6 py-6" cols="12">
          <!-- ORGANIZATION -->
          <div class="text-body-2 dm-sans hyphenate-break-2">
            {{ props.card.organization }}
          </div>
          <!-- NAME -->
          <div style="line-height: 1.8rem" class="pt-3 text-sm-h5 poppins hyphenate-break-3">
            {{ props.card.name.fi }}
          </div>
          <!-- CREDITS -->
          <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("CREDITS") }}:</div>
          <div class="poppins" v-if="props.card.credits">{{ props.card.credits }}</div>
          <div class="poppins" v-else>-</div>
        </v-col>
        <!-- MATCHES -->
        <v-row no-gutters justify="end" align="end">
          <v-col
            cols="5"
            class="py-3 card-footer"
            :class="props.card.match_count == 0 && 'card-footer-transparent'"
          >
            <div v-if="props.card.match_count > 0" class="text-center dm-sans">
              {{ tr("MATCHES") }}!
            </div>
            <div v-else class="text-center card-text-medium">{{ tr("MATCHES") }}</div>
            <div v-if="props.card.match_count > 99" class="text-sm-h6 text-center poppins">>99</div>
            <div v-else-if="props.card.match_count > 0" class="text-sm-h6 text-center poppins">
              {{ props.card.match_count }}
            </div>
            <div v-else class="text-center poppins">-</div>
          </v-col>
        </v-row>
      </v-row>
    </v-card>
  </v-container>
</template>

<style scoped>
@import url("../../assets/styles.css");
</style>
