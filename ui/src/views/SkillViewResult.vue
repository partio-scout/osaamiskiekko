<script setup lang="ts">
// FINAL PAGE THAT DISPLAYS THE CORRESPONDENCE OF A DEGREE TO A SKILL
import { useRoute } from "vue-router";
import { tr } from "../composables/internationalization";
import { onMounted, ref } from "vue";
import useApiStore from "../store/api";
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import DegreeCardFull from "../components/cards/DegreeCardFull.vue";
import ResultCard from "../components/cards/ResultCard.vue";
import SkillCardFull from "../components/cards/SkillCardFull.vue";
import Thumbs from "../components/Thumbs.vue";

const apiStore = useApiStore();

const route = useRoute();

const degreeId = route.params.degreeId as string;
const skillId = route.params.skillId as string;

onMounted(() => {
  window.scrollTo(0, 0); // scroll to top
  // fetch degree and skill
  if (!apiStore.degree) {
    apiStore.getDegree(degreeId);
  }
  if (!apiStore.skill) {
    apiStore.getSkill(skillId);
  }
  // white card
  if (!apiStore.degreeMatch) {
    apiStore.getSkillMatch(skillId, degreeId);
  }
});
</script>

<template>
  <v-container class="container" style="min-height: 100%" fluid>
    <!-- MAIN WRAPPER -->
    <v-row class="fill-height" style="max-width: 2000px; margin: 0 auto">
      <v-col cols="12">
        <!-- HEADER -->
        <Header :route-to="`/skills/${route.params.skillId}`" :text="tr('RETURN_BUTTON_3')" />
        <!-- WRAPPER -->
        <v-row justify="center">
          <v-col cols="11">
            <v-row>
              <!-- TITLE -->
              <v-col cols="12" class="pb-0">
                <div class="pb-4 text-h6 text-sm-h4 text-md-h3 poppins-turquoise">
                  {{ tr("DEGREE_FINAL_RESULT_VIEW_HEADING") }}
                </div>
              </v-col>
              <!-- help text -->
              <v-col cols="12" class="d-none d-sm-block">
                <div class="mb-0 mb-sm-14 text-subtitle-2 text-sm-h6 poppins-white">
                  {{ tr("RESULT_HELP_TEXT") }}
                </div>
              </v-col>

              <!-- SECTION 1 -->
              <v-col cols="12" :sm="12" :md="5" :lg="3" :xl="3">
                <v-row dense>
                  <!-- HEADING -->
                  <v-col cols="12">
                    <div class="text-sm-h6 poppins-white">{{ tr("SELECTED_SKILL") }}:</div>
                  </v-col>
                  <!-- SELECTED SKILL -->
                  <v-col cols="12" :sm="12" :md="12" :lg="12" :xl="12" v-auto-animate>
                    <!-- LOADING ICON -->
                    <v-col style="text-align: center" v-if="apiStore.isLoading.skill">
                      <v-progress-circular
                        aria-label="{{ tr('LOADING_SKILL') }}"
                        class="mt-10"
                        indeterminate
                        color="purple"
                      ></v-progress-circular>
                    </v-col>
                    <!-- CARD -->
                    <SkillCardFull class="mx-0 px-0" v-if="apiStore.skill" :card="apiStore.skill" />
                  </v-col>
                </v-row>
              </v-col>

              <!-- PLUS sign -->
              <v-col
                class="text-center pl-md-5 text-h4 text-sm-h2 pt-md-16 poppins-turquoise"
                cols="12"
                :sm="12"
                :md="1"
                :lg="1"
                :xl="1"
                ><div>+</div></v-col
              >

              <!-- SECTION 2 -->
              <v-col cols="12" :sm="12" :md="6" :lg="3" :xl="3">
                <v-row dense>
                  <!-- HEADING -->
                  <v-col cols="12">
                    <div class="text-sm-h6 poppins-white">
                      {{ tr("DEGREE_RESULT_VIEW_SELECTED_DEGREE") }}:
                    </div>
                  </v-col>
                  <!-- SELECTED DEGREE -->
                  <v-col cols="12" :sm="12" :md="10" :lg="12" :xl="12" v-auto-animate>
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
                      v-if="apiStore.degree && apiStore.skill"
                      :card="apiStore.degree"
                    />
                  </v-col>
                </v-row>
              </v-col>

              <!-- EQUAL sign -->
              <v-col
                class="ma-0 pa-0 pl-md-5 text-center text-h4 text-sm-h2 pt-lg-16 poppins-turquoise"
                cols="12"
                :sm="12"
                :md="11"
                :lg="1"
                :xl="1"
                ><div>=</div></v-col
              >

              <!-- SECTION 3 -->
              <v-col cols="12" :sm="12" :md="12" :lg="3" :xl="3">
                <v-row dense justify="center">
                  <!-- HEADING -->
                  <v-col cols="12" :sm="12" :md="8" :lg="12" :xl="12">
                    <div class="text-sm-h6 pl-0 poppins-white">{{ tr("CORRESPONDENCE") }}:</div>
                  </v-col>
                  <!-- RESULT  -->
                  <v-col cols="12" :sm="12" :md="8" :lg="12" :xl="12" v-auto-animate>
                    <!-- LOADING ICON -->
                    <v-col style="text-align: center" v-if="apiStore.isLoading.skillMatch">
                      <v-progress-circular
                        aria-label="{{ tr('LOADING_RESULT') }}"
                        class="mt-10"
                        indeterminate
                        color="h1"
                      ></v-progress-circular>
                    </v-col>
                    <!-- CARD -->
                    <ResultCard
                      class="mx-0 px-0"
                      v-if="apiStore.skillMatch"
                      :card="apiStore.skillMatch"
                    />
                  </v-col>
                </v-row>
              </v-col>

              <!-- RATE MATCH -->
              <v-col class="pb-10" cols="12" style="color: rgb(var(--v-theme-h1))">
                <Thumbs :degreeId="degreeId" :skillId="skillId" :feedbackType="'skill'" />
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
