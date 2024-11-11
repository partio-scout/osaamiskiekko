<script setup lang="ts">
// WHITE RESULT CARD
import { tr } from "../../composables/internationalization";
import useApiStore from "../../store/api";

const apiStore = useApiStore();

const props = defineProps({
  card: { type: Object, required: true }
});
</script>

<template>
  <v-container>
    <v-card class="result-card">
      <v-row no-gutters>
        <v-col class="px-10 py-6" cols="12">
          <!-- HEADER TEXT -->
          <div class="text-subtitle-2 text-sm-body-2 dm-sans">
            {{ tr("ESTIMATE") }}
          </div>
          <!-- TITLE -->
          <div style="line-height: 1.8rem" class="pt-3 pb-3 text-h6 text-sm-h5 poppins">
            {{ `${tr("CORRESPONDENCE_TITLE")}:` }}
          </div>
          <!-- DEGREE PARTS / COURSES -->
          <div
            v-if="props.card.tutkinnonosat"
            v-for="item in props.card.tutkinnonosat"
            class="dm-sans"
          >
            • {{ item }}
          </div>
          <div v-else class="dm-sans">-</div>

          <div class="pt-5 text-subtitle-2 dm-sans">{{ tr("KEYWORDS_USED") }}:</div>
          <div v-if="props.card.keywords" class="poppins">{{ props.card.keywords.join(", ") }}</div>
          <div v-else class="poppins">-</div>
        </v-col>
        <!-- BOTTOM PART -->
        <v-col align-self="end" cols="12">
          <v-row no-gutters>
            <v-col cols="12" class="py-3 px-10 card-footer-wide">
              <v-row class="pt-10 pb-5">
                <!-- LOGO -->
                <v-col class="px-sm-1" cols="2" :sm="1">
                  <v-icon>
                    <img
                      src="../../assets/osaamiskiekko-logo.png"
                      alt="{{ tr('OSAAMISKIEKKO_LOGO') }}"
                      width="40"
                      height="40"
                    /> </v-icon
                ></v-col>
                <!-- LOGO TEXT -->
                <v-col cols="10" :sm="11" class="pl-lg-6">
                  <div class="text-subtitle-2 dm-sans">
                    {{ tr("ESTIMATE") }}
                  </div>
                </v-col>
                <!-- INFO TEXT -->
                <v-col cols="0" :sm="1" class="pa-0 ma-0"></v-col>
                <v-col cols="12" :sm="11" class="pl-lg-6">
                  <div class="text-subtitle-2 dm-sans">
                    {{ tr("RESULT_CARD_INFO") }}
                  </div>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>

<style scoped>
@import url("../../assets/styles.css");
</style>
