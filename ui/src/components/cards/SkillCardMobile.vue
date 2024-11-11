<script setup lang="ts">
// TURQUOISE DEGREE CARD
import { tr } from "../../composables/internationalization";
import useApiStore from "../../store/api";
import { ref } from "vue";

const apiStore = useApiStore();

const showMore = ref(false);

const props = defineProps({
  card: { type: Object, required: true },
  expanded: { type: Boolean }
});
</script>

<template>
  <v-container class="px-0">
    <v-card class="skill-card--no-hover">
      <v-row no-gutters>
        <v-col v-auto-animate>
          <v-row no-gutters>
            <v-col class="px-6 pt-6" cols="12">
              <!-- ORGANIZATION -->
              <div class="text-subtitle-2 dm-sans hyphenate-break-1">
                {{ props.card.organization }}
              </div>
              <!-- NAME -->
              <div
                style="line-height: 1.8rem"
                class="pt-3 text-h6 poppins hyphenate-break-3"
                v-if="props.card.name.fi"
              >
                {{ props.card.name.fi }}
              </div>
              <!-- a spacer for when the card is not expanded -->
              <div v-if="!expanded" class="pt-9"></div>
            </v-col>
          </v-row>
          <!-- BOTTOM PART -->
          <span v-if="expanded">
            <v-row no-gutters>
              <!-- CREDITS -->
              <v-col cols="12">
                <div class="pl-6 pt-3 text-subtitle-2 dm-sans">{{ tr("CREDITS") }}:</div>
              </v-col>
              <v-col cols="7">
                <div class="pl-6 poppins" v-if="props.card.credits">
                  {{ props.card.credits }}
                </div>
                <div class="pl-6 poppins" v-else>-</div>
              </v-col>
              <!-- MATCHES -->
              <v-col
                justify-self="end"
                align-self="end"
                cols="5"
                class="py-3 card-footer"
                :class="props.card.match_count == 0 && 'card-footer-transparent'"
              >
                <div v-if="props.card.match_count > 0" class="text-center dm-sans">
                  {{ tr("MATCHES") }}!
                </div>
                <div v-else class="text-center dm-sans">{{ tr("MATCHES") }}</div>
                <div v-if="props.card.match_count > 99" class="text-sm-h6 text-center poppins">
                  >99
                </div>
                <div v-else-if="props.card.match_count > 0" class="text-sm-h6 text-center poppins">
                  {{ props.card.match_count }}
                </div>
                <div v-else class="text-center poppins">-</div>
              </v-col>
            </v-row>
          </span>
        </v-col>
      </v-row>
    </v-card>

    <!-- GO TO NEXT PAGE -button -->
    <v-row v-if="expanded">
      <v-col cols="12" class="pb-8 text-center">
        <v-btn
          class="mt-7 text-subtitle-1 poppins button--purple"
          :text="tr('SHOW_MATCHES')"
          :to="`skills/${card.id}`"
        >
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<style scoped>
@import url("../../assets/styles.css");
</style>
