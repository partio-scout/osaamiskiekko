<script setup lang="ts">
import { tr } from "../composables/internationalization";
import CookieConsent from './CookieConsent.vue';
</script>

<template>
  <v-footer class="py-16 my-16 bg-transparent">
    <v-row justify="center" no-gutters>
      <!-- TOP ROW -->
      <v-col class="mb-8 text-center" cols="12">
        <v-btn
          class="mx-2 text-caption text-md-body-2"
          color="h2h3"
          variant="plain"
          href="https://www.osaamiskiekko.fi/fi/"
          target="_blank"
          alt="{{ tr('OSAAMISKIEKKO_INFO') }}"
        >
          <img
            src="../assets/osaamiskiekko-logo.png"
            alt="{{ tr('OSAAMISKIEKKO_LOGO') }}"
            height="30"
            class="mr-3"
          />
          Osaamiskiekko.fi
        </v-btn>
        <v-btn
          class="mx-2 text-caption text-md-body-2"
          color="h2h3"
          variant="plain"
          href="https://www.osaamiskiekko.fi/fi/accessibility/"
          target="_blank"
          alt="{{ tr('ACCESSIBILITY_INFO') }}"
        >
          {{ tr("ACCESSIBILITY") }}
        </v-btn>
        <v-btn
          class="mx-2 text-caption text-md-body-2"
          color="h2h3"
          variant="plain"
          rounded="xl"
          href="https://www.partio.fi/suomen-partiolaiset/tietoa-meista/henkilotietojen-kasittely/tietosuojaseloste/"
          target="_blank"
          alt="{{ tr('PRIVACY_INFO') }}"
        >
          {{ tr("PRIVACY") }}
        </v-btn>
      </v-col>

      <!-- MIDDLE ROW -->
      <v-col class="mb-8 text-center" cols="12">
        <v-btn
          color="h2h3"
          variant="plain"
          class="mx-2"
          href="https://kentauri.fi/"
          target="_blank"
          size="x-large"
          alt="{{ tr('KENTAURI_INFO') }}"
        >
          <img src="../assets/kentauri-logo-big.png" alt="{{ tr('KENTAURI_LOGO') }}" height="50" />
        </v-btn>
        <v-btn
          color="h2h3"
          variant="plain"
          class="mx-2"
          href="https://okm.fi/etusivu"
          target="_blank"
          size="x-large"
          alt="{{ tr('OMK_INFO') }}"
        >
          <img src="../assets/okm-logo.png" alt="{{ tr('OMK_LOGO') }}" height="25" />
        </v-btn>

        <v-btn
          color="h2h3"
          variant="plain"
          class="mx-2"
          href="https://www.10monkeysdigital.com/"
          target="_blank"
          size="x-large"
          alt="{{ tr('TEN_MONKEYS_INFO') }}"
        >
          <img
            src="../assets/10monkeys-logo_480.png"
            alt="{{ tr('TEN_MONKEYS_LOGO') }}"
            height="35"
          />
        </v-btn>
        <v-btn
          color="h2h3"
          variant="plain"
          class="mx-2"
          href="https://www.vxt-research.com/"
          target="_blank"
          size="x-large"
          alt="{{ tr('VXT_INFO') }}"
        >
          <img src="../assets/vxt-logo.png" alt="{{ tr('VXT_LOGO') }}" height="30" />
        </v-btn>
      </v-col>

      <!-- BOTTOM ROW -->
      <v-col class="text-center text-caption text-md-body-2 dm-sans" cols="12" style="color: grey">
        Copyright &#169; 2023 Suomen Partiolaiset – Finlands Scouter ry. All rights reserved.
      </v-col>
      <v-col cols="12">
        <CookieConsent />
      </v-col>
    </v-row>
  </v-footer>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
