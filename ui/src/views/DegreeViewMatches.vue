<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { useRoute } from "vue-router";
import { onMounted, ref } from "vue";
import useApiStore from "../store/api";
import Header from "../components/Header.vue";
import useSearchStore from "../store/search";
import Footer from "../components/Footer.vue";
import DegreeCardFull from "../components/cards/DegreeCardFull.vue";
import SkillCardMinimal from "../components/cards/SkillCardMinimal.vue";

const apiStore = useApiStore();
const searchStore = useSearchStore();

const route = useRoute();
const degreeId = route.params.degreeId as string;

// Amount of results shown
const displayAmount = ref(20);
const showMore = () => {
  displayAmount.value += 20;
};

// FETCH degree and skills
onMounted(() => {
  window.scrollTo(0, 0); // scroll to top

  // fetch degree and matching skills
  if (!apiStore.degree) {
    apiStore.getDegree(degreeId);
  }
  if (!apiStore.skillMatches) {
    apiStore.getMatchingSkills(degreeId);
  }

  // clear skill property if it exists
  if (apiStore.skill != null) {
    apiStore.skill = null;
  }
  // clear degreeMatch
  if (apiStore.degreeMatch != null) {
    apiStore.degreeMatch = null;
  }
});
</script>

<template>
  <v-container class="container" style="min-height: 100%" fluid>
    <!-- MAIN WRAPPER -->
    <v-row class="fill-height" style="max-width: 2000px; margin: 0 auto">
      <v-col cols="12">
        <!-- HEADER -->
        <Header route-to="/degrees" :text="tr('RETURN_BUTTON_2')" />
        <!-- WRAPPER -->
        <v-row justify="center">
          <v-col cols="11">
            <v-row>
              <!-- TITLE -->
              <v-col cols="12" class="pb-0">
                <div class="pb-4 text-h6 text-sm-h4 text-md-h3 poppins-purple">
                  {{ tr("DEGREE_RESULT_VIEW_HEADING") }}
                </div>
              </v-col>
              <!-- help text -->
              <v-col cols="12" class="d-none d-sm-block">
                <div class="mb-0 mb-sm-14 text-subtitle-2 text-sm-h6 poppins-white">
                  {{ tr("SELECT_MATCH_HELP_TEXT") }}
                </div>
              </v-col>

              <!-- SECTION 1 -->
              <v-col cols="12" :sm="12" :md="6" :lg="3" :xl="3">
                <v-row dense>
                  <!-- HEADING -->
                  <v-col cols="12">
                    <div class="text-sm-h6 poppins-white">
                      {{ tr("DEGREE_RESULT_VIEW_SELECTED_DEGREE") }}:
                    </div>
                  </v-col>
                  <!-- SELECTED DEGREE -->
                  <v-col cols="12" :md="10" :lg="12" :xl="12" v-auto-animate>
                    <!-- LOADING ICON -->
                    <v-col style="text-align: center" v-if="apiStore.isLoading.degree">
                      <v-progress-circular
                        aria-label="{{ tr('LOADING_DEGREE') }}"
                        class="mt-10"
                        indeterminate
                        color="turquoise"
                      ></v-progress-circular>
                    </v-col>
                    <!-- CARD -->
                    <DegreeCardFull
                      class="mx-0 px-0"
                      v-if="apiStore.degree"
                      :card="apiStore.degree"
                    />
                  </v-col>
                </v-row>
              </v-col>
              <v-spacer></v-spacer>

              <!-- SECTION 2 -->
              <v-col cols="12" :sm="12" :md="6" :lg="8" :xl="8" style="min-height: 50vh">
                <v-row dense>
                  <!-- HEADING -->
                  <v-col cols="12">
                    <div class="ml-lg-5 text-sm-h6 poppins-white">
                      {{
                        `${tr("FOUND_MATCHES")} (${
                          apiStore.skillMatches ? apiStore.skillMatches.length : 0
                        })`
                      }}
                    </div>
                  </v-col>

                  <!-- GRID -->
                  <v-col cols="12">
                    <v-row no-gutters v-auto-animate>
                      <!-- LOADING ICON -->
                      <v-col style="text-align: center" v-if="apiStore.isLoading.skillMatches">
                        <v-progress-circular
                          aria-label="{{ tr('LOADING_SKILLS') }}"
                          class="mt-10"
                          indeterminate
                          color="purple"
                        ></v-progress-circular>
                      </v-col>
                      <!-- GRID CARDS -->
                      <v-col
                        cols="12"
                        :sm="6"
                        :md="12"
                        :lg="4"
                        :xl="4"
                        v-if="apiStore.skillMatches"
                        v-for="object in apiStore.skillMatches.slice(0, displayAmount)"
                        :key="object.id"
                      >
                        <SkillCardMinimal
                          :card="object"
                          :urlFrom="route.params.degreeId.toString()"
                        />
                      </v-col>

                      <!-- SHOW MORE-->
                      <v-col
                        v-if="apiStore.skillMatches && displayAmount < apiStore.skillMatches.length"
                        cols="12"
                        class="pb-10 pt-6 ma-0 d-flex justify-center align-center"
                      >
                        <v-btn
                          alt="{{ tr('SHOW_MORE') }}"
                          variant="plain"
                          color="transparent"
                          @click="showMore"
                        >
                          <div class="poppins-white" v-if="apiStore.skillMatches">
                            {{
                              `${tr("SHOW_MORE")} (${apiStore.skillMatches.length - displayAmount})`
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
