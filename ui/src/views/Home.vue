<script setup lang="ts">
import { tr } from "../composables/internationalization";
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
</script>

<template>
  <v-container class="container" style="min-height: 100%" fluid>
    <v-row style="min-height: 100vh; max-width: 2000px; margin: 0 auto">
      <!-- HEADER -->
      <v-col class="pb-16" cols="12" align-self="start">
        <Header />
      </v-col>

      <v-col cols="12">
        <v-row>
          <!-- UPPER TEXT -->
          <v-col cols="12" class="pt-16 pb-16 text-center" align-self="center">
            <v-row class="text-center" justify="center">
              <v-col cols="8">
                <div class="text-h5 text-sm-h4 text-md-h3 heading">
                  {{ tr("HOME_HEADING") }}
                </div>
              </v-col>
            </v-row>
          </v-col>

          <!-- BUTTONS -->
          <v-col cols="12" class="pb-16 mb-16 text-center" align-self="center">
            <v-row class="text-center" justify="center">
              <v-col cols="12" :sm="6" class="text-sm-right">
                <v-btn class="button" to="/degrees" :text="tr('HOME_BUTTON_1')" />
              </v-col>
              <v-col cols="12" :sm="6" class="text-sm-left">
                <v-btn class="button" to="/skills" :text="tr('HOME_BUTTON_2')" />
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-col>

      <!-- BOTTOM TEXT -->
      <!-- <v-col cols="12" class="pt-16 pb-16 text-center" align-self="center">
        <v-row class="text-center" justify="center">
          <v-col cols="10" :sm="9" :md="4">
            <div class=" text-sm-h6 dm-sans-white">
              {{ tr("HOME_SUBHEADING_1") }}
            </div>
          </v-col>
        </v-row>
        <v-row class="text-center" justify="center">
          <v-col cols="10" :sm="9" :md="4">
            <div class=" text-sm-h6 dm-sans-white">
              {{ tr("HOME_SUBHEADING_2") }}
            </div>
          </v-col>
        </v-row>
      </v-col> -->

      <!-- FOOTER -->
      <Footer />
    </v-row>
  </v-container>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
