<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { onMounted, ref } from "vue";
import useApiStore from "../store/api";
import useSearchStore from "../store/search";
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import DegreeCard from "../components/cards/DegreeCard.vue";
import DegreeCardMobile from "../components/cards/DegreeCardMobile.vue";
import DegreeFilters from "../components/DegreeFilters.vue";
import DegreeFiltersMobile from "../components/DegreeFiltersMobile.vue";

const apiStore = useApiStore();
const searchStore = useSearchStore();

// Amount of results shown
const displayAmount = ref(20);
const showMore = () => {
  displayAmount.value += 20;
};

// Keeps track of which card is expanded - only on mobile
const expandedCard = ref<string>("");

// FETCH degrees
onMounted(() => {
  window.scrollTo(0, 0); // scroll to top
  // check if degrees are already loaded, if not, fetch them
  if (!apiStore.degrees) {
    apiStore.getDegrees();
  }
  // clear skillMatches and degree properties if they exist
  if (apiStore.skillMatches != null) {
    apiStore.skillMatches = null;
  }
  if (apiStore.degree != null) {
    apiStore.degree = null;
  }
});
</script>

<template>
  <v-container class="container" style="min-height: 100%" fluid>
    <!-- MAIN WRAPPER -->
    <v-row class="fill-height" style="max-width: 2000px; margin: 0 auto">
      <v-col cols="12">
        <!-- HEADER -->
        <Header route-to="/" :text="tr('RETURN_BUTTON_1')" />
        <!-- WRAPPER -->
        <v-row justify="center">
          <v-col cols="11">
            <v-row>
              <!-- TITLE -->
              <v-col cols="12" class="pb-0">
                <div class="text-h6 text-sm-h4 text-md-h3 pb-4 poppins-purple">
                  {{ tr("DEGREE_VIEW_HEADING") }}
                </div>
              </v-col>
              <!-- help text -->
              <v-col cols="12" class="d-none d-sm-block">
                <div class="mb-0 mb-sm-14 text-subtitle-2 text-sm-h6 poppins-white">
                  {{ tr("HELP_TEXT_DEGREE") }}
                </div>
              </v-col>

              <!-- SECTION 1 (filters) -->
              <v-col cols="12" :lg="3" :xl="3">
                <!-- DESKTOP -->
                <DegreeFilters class="d-none d-sm-block" />
                <!-- MOBILE -->
                <DegreeFiltersMobile class="d-block d-sm-none" />
              </v-col>

              <!-- SECTION 2 (cards) -->
              <v-col cols="12" :lg="9" :xl="9" style="min-height: 50vh">
                <v-row dense>
                  <!-- HEADING -->
                  <v-col cols="12" :md="6">
                    <div
                      v-if="searchStore.filteredDegrees && searchStore.searchQueryDegree !== ''"
                      class="ml-lg-5 text-sm-h6 dm-sans-white"
                    >
                      {{
                        `${tr("DEGREE_VIEW_GRID_TITLE_2")} "${searchStore.searchQueryDegree}" (${
                          searchStore.filteredDegrees.length
                        })`
                      }}
                    </div>
                    <div
                      v-else-if="searchStore.filteredDegrees"
                      class="ml-lg-5 text-sm-h6 dm-sans-white"
                    >
                      {{
                        `${tr("DEGREE_VIEW_GRID_TITLE_1")} (${searchStore.filteredDegrees.length})`
                      }}
                    </div>
                  </v-col>
                  <!-- CLEAR FILTERS -->
                  <v-col>
                    <div
                      alt="{{ tr('CLEAR_FILTERS') }}"
                      v-if="searchStore.searchIsActiveDegree && searchStore.filteredDegrees"
                      style="text-align: right; color: lightgray; cursor: pointer"
                      @click="searchStore.clearFiltersDegree"
                      class="pr-10 tex-subtitle-2 dm-sans"
                    >
                      <span style="text-decoration: underline">{{ `${tr("CLEAR_FILTERS")}` }}</span
                      ><span>{{ " " }}</span>
                      <v-icon color="lightgray" size="medium">close</v-icon>
                    </div>
                  </v-col>
                  <!-- GRID -->
                  <v-col cols="12">
                    <v-row no-gutters v-auto-animate>
                      <!-- LOADING ICON -->
                      <v-col style="text-align: center" v-if="apiStore.isLoading.degrees">
                        <v-progress-circular
                          aria-label="{{ tr('LOADING_DEGREES') }}"
                          class="mt-10"
                          indeterminate
                          color="turquoise"
                        ></v-progress-circular>
                      </v-col>
                      <!-- GRID CARDS -->
                      <v-col
                        cols="12"
                        :sm="6"
                        :md="4"
                        :lg="3"
                        :xl="3"
                        v-for="object in searchStore.filteredDegrees.slice(0, displayAmount)"
                        :key="object.id"
                      >
                        <template v-if="searchStore.filteredDegrees.length > 0">
                          <!-- CARD - DESKTOP -->
                          <DegreeCard :card="object" class="d-none d-sm-block" />
                          <!-- CARD - MOBILE -->
                          <DegreeCardMobile
                            :card="object"
                            :expanded="object.id == expandedCard"
                            @click="
                              expandedCard == object.id
                                ? (expandedCard = '')
                                : (expandedCard = object.id)
                            "
                            class="d-block d-sm-none"
                          />
                        </template>
                      </v-col>
                      <!-- NO MATCHES -->
                      <v-col
                        cols="12"
                        v-if="
                          searchStore.filteredDegrees?.length == 0 && !apiStore.isLoading.degrees
                        "
                      >
                        <div class="pt-16 text-sm-h6 dm-sans-white" style="text-align: center">
                          {{ tr("NO_MATCHES") }}
                        </div>
                      </v-col>
                      <!-- SHOW MORE-->
                      <v-col
                        v-if="
                          searchStore.filteredDegrees &&
                          displayAmount < searchStore.filteredDegrees.length
                        "
                        cols="12"
                        class="pb-10 pt-6 ma-0 d-flex justify-center align-center"
                      >
                        <v-btn
                          alt="{{ tr('SHOW_MORE') }}"
                          variant="plain"
                          color="transparent"
                          @click="showMore"
                        >
                          <div class="poppins-white" v-if="searchStore.filteredDegrees">
                            {{
                              `${tr("SHOW_MORE")} (${
                                searchStore.filteredDegrees.length - displayAmount
                              })`
                            }}
                          </div>
                          <v-icon color="h2h3" size="x-large">keyboard_arrow_down</v-icon>
                        </v-btn>
                      </v-col>
                    </v-row>
                  </v-col>
                </v-row>
              </v-col>
              <!-- FOOTER -->
              <Footer />
            </v-row>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
