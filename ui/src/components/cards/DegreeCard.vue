<script setup lang="ts">
// TURQUOISE DEGREE CARD
import { tr } from "../../composables/internationalization";
import useApiStore from "../../store/api";
import { ref } from "vue";

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
  card: { type: Object, required: true }
});
</script>

<template>
  <v-container class="px-0 pa-sm-3">
    <v-card :class="cardClass()" :to="`degrees/${card.id}`">
      <v-row no-gutters>
        <v-col>
          <v-row no-gutters>
            <v-col class="px-6 pt-6" cols="12">
              <!-- FIELD -->
              <div
                class="text-subtitle-2 text-sm-body-2 dm-sans hyphenate-break-1"
                v-if="props.card.field.fi"
              >
                {{ props.card.field.fi.toUpperCase() }}
              </div>
              <!-- NAME -->
              <div
                style="line-height: 1.8rem"
                class="pt-3 text-h6 text-sm-h5 poppins hyphenate-break-3"
                v-if="props.card.name.fi"
              >
                {{ props.card.name.fi }}
              </div>
              <!-- DEGREE(s) -->
              <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("DEGREE") }}:</div>
              <div class="poppins hyphenate-break-3" v-if="props.card.degrees.fi.length > 0">
                {{ props.card.degrees.fi.join(", ").toLowerCase() }}
              </div>
              <div class="poppins" v-else>-</div>
              <!-- ORGANIZATION(s) -->
              <div class="pt-3 text-subtitle-2 dm-sans">{{ tr("ORGANIZATIONS") }}:</div>
              <div class="poppins" v-if="props.card.organizations_count > 1">
                {{ props.card.organizations_count }} {{ tr("DEGREE_ORGANIZERS") }}
              </div>
              <div class="poppins" v-else-if="props.card.organizations_count == 1">
                {{
                  props.card.organizations[0].charAt(0).toUpperCase() +
                  props.card.organizations[0].slice(1).toLowerCase()
                }}
              </div>
              <div class="poppins" v-else>-</div>
            </v-col>
          </v-row>
          <!-- BOTTOM PART -->
          <v-row no-gutters>
            <!-- CREDITS -->
            <v-col cols="12">
              <div class="pl-6 pt-3 text-subtitle-2 dm-sans">{{ tr("CREDITS") }}:</div>
            </v-col>
            <v-col cols="7">
              <div class="pl-6 poppins" v-if="props.card.credits">{{ props.card.credits }}</div>
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
              <div v-else-if="props.card.match_count > 0" class="text-sm-h6 text-center poppins">{{ props.card.match_count }}</div>
              <div v-else class="text-center poppins">-</div>
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
