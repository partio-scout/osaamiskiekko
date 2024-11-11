<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { onMounted, ref } from "vue";
import useApiStore from "../store/api";
import useSearchStore from "../store/search";
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import SkillCard from "../components/cards/SkillCard.vue";
import SkillCardMobile from "../components/cards/SkillCardMobile.vue";
import SkillFilters from "../components/SkillFilters.vue";
import SkillFiltersMobile from "../components/SkillFiltersMobile.vue";

const apiStore = useApiStore();
const searchStore = useSearchStore();

// Amount of results shown
const displayAmount = ref(20);
const showMore = () => {
  displayAmount.value += 20;
};

// Keeps track of which card is expanded - only on mobile
const expandedCard = ref<string>("");

// FETCH skills
onMounted(() => {
  window.scrollTo(0, 0); // scroll to top

  // check if skills are already loaded, if not, fetch them
  if (!apiStore.skills) {
    apiStore.getSkills();
  }
  // clear degreeMatches and skill properties if they exist
  if (apiStore.degreeMatches != null) {
    apiStore.degreeMatches = null;
  }
  if (apiStore.skill != null) {
    apiStore.skill = null;
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
                <div class="text-h6 text-sm-h4 text-md-h3 pb-4 poppins-turquoise">
                  {{ tr("SKILL_VIEW_HEADING") }}
                </div>
              </v-col>
              <!-- help text -->
              <v-col cols="12" class="d-none d-sm-block">
                <div class="mb-0 mb-sm-14 text-subtitle-2 text-sm-h6 poppins-white">
                  {{ tr("HELP_TEXT_SKILL") }}
                </div>
              </v-col>

              <!-- SECTION 1 (filters) -->
              <v-col cols="12" :lg="3" :xl="3">
                <!-- DESKTOP -->
                <SkillFilters class="d-none d-sm-block" />
                <!-- MOBILE -->
                <SkillFiltersMobile class="d-block d-sm-none" />
              </v-col>

              <!-- SECTION 2 (cards) -->
              <v-col cols="12" :lg="9" :xl="9" style="min-height: 50vh">
                <v-row dense>
                  <!-- HEADING -->
                  <v-col cols="12" :md="6">
                    <div
                      v-if="searchStore.filteredSkills && searchStore.searchQuerySkill !== ''"
                      class="ml-lg-5 text-sm-h6 dm-sans-white"
                    >
                      {{
                        `${tr("DEGREE_VIEW_GRID_TITLE_2")} "${searchStore.searchQuerySkill}" (${
                          searchStore.filteredSkills.length
                        })`
                      }}
                    </div>
                    <div
                      v-else-if="searchStore.filteredSkills"
                      class="ml-lg-5 text-sm-h6 dm-sans-white"
                    >
                      {{
                        `${tr("SKILL_VIEW_GRID_TITLE_1")} (${searchStore.filteredSkills.length})`
                      }}
                    </div>
                  </v-col>
                  <!-- CLEAR FILTERS -->
                  <v-col>
                    <div
                      alt="{{ tr('CLEAR_FILTERS') }}"
                      v-if="searchStore.searchIsActiveSkill && searchStore.filteredSkills"
                      style="text-align: right; color: lightgray; cursor: pointer"
                      @click="searchStore.clearFiltersSkill"
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
                      <v-col style="text-align: center" v-if="apiStore.isLoading.skills">
                        <v-progress-circular
                          aria-label="{{ tr('LOADING_SKILLS') }}"
                          class="mt-10"
                          indeterminate
                          color="turquoise"
                        ></v-progress-circular>
                      </v-col>
                      <!-- GRID CARDS -->
                      <v-col
                        v-if="searchStore.filteredSkills"
                        cols="12"
                        :sm="6"
                        :md="4"
                        :lg="3"
                        :xl="3"
                        v-for="object in searchStore.filteredSkills.slice(0, displayAmount)"
                        :key="object.id"
                      >
                        <template
                          v-if="searchStore.filteredSkills && searchStore.filteredSkills.length > 0"
                        >
                          <!-- CARD - DESKTOP -->
                          <SkillCard :card="object" class="d-none d-sm-block" />
                          <!-- CARD - MOBILE -->
                          <SkillCardMobile
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
                        v-if="searchStore.filteredSkills?.length == 0 && !apiStore.isLoading.skills"
                      >
                        <div class="pt-16 text-sm-h6 dm-sans-white" style="text-align: center">
                          {{ tr("NO_MATCHES") }}
                        </div>
                      </v-col>
                      <!-- SHOW MORE-->
                      <v-col
                        v-if="
                          searchStore.filteredSkills &&
                          displayAmount < searchStore.filteredSkills.length
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
                          <div class="poppins-white" v-if="searchStore.filteredSkills">
                            {{
                              `${tr("SHOW_MORE")} (${
                                searchStore.filteredSkills.length - displayAmount
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
