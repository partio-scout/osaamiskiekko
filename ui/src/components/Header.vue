<script setup lang="ts">
import { tr } from "../composables/internationalization";
import LangDropdown from "./LangDropdown.vue";

// HEADER WITH A RETURN BUTTON
const props = defineProps({
  routeTo: { type: String },
  text: { type: String }
});
</script>

<template>
  <!-- HEADER FOR HOME VIEW -->
  <v-row v-if="!routeTo">
    <!-- BACK BUTTON -->
    <v-col offset="4" cols="4" class="text-subtitle-2 text-sm-h6 text-center my-sm-10 poppins">
      <v-btn variant="plain">
        <a
          style="text-decoration: none; color: rgb(var(--v-theme-h2h3))"
          href="https://www.osaamiskiekko.fi/fi/"
          target="_blank"
          >Osaamiskiekko.fi</a
        >
      </v-btn>
    </v-col>
    <!-- LANGUAGE SELECTION -->
    <v-col cols="4" class="my-sm-10 pr-sm-10" align="right">
      <LangDropdown/>
      <!-- BETA TAG -->
      <p
        style="border-radius: 3px; background-color: darkkhaki; color: black; max-width: 80px"
        class="px-2 text-center text-subtitle-2 text-sm-h6 poppins-white"
      >
        BETA
      </p>
    </v-col>
  </v-row>

  <!-- HEADER FOR OTHER VIEWS -->
  <v-row v-if="routeTo">
    <!-- LINK -->
    <v-col cols="6" class="my-sm-10">
      <v-btn variant="plain" color="transparent" :to="props.routeTo">
        <v-icon :alt="tr('BACK_BUTTON')" color="h2h3" size="x-large"
          >keyboard_arrow_left</v-icon
        >
        <div class="text-subtitle-2 text-sm-h6 poppins-white">
          {{ props.text }}
        </div>
      </v-btn>
    </v-col>
    <!-- LANGUAGE SELECTION -->
    <v-col cols="6" class="my-sm-10 pr-sm-10" align="right">
      <LangDropdown/>
      <!-- BETA TAG -->
      <p
        style="border-radius: 3px; background-color: darkkhaki; color: black; max-width: 80px"
        class="px-2 text-center text-subtitle-2 text-sm-h6 poppins-white"
      >
        BETA
      </p>
    </v-col>
  </v-row>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
