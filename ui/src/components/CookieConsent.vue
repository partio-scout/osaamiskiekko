<template>
  <!-- Dialog -->
  <v-dialog class="cookie-dialog" v-if="!store.isConsentStored || dialogOpen" v-model="dialogOpen" persistent>
    <v-card class="dm-sans cookie-card">
      <v-card-text class="pa-0 ma-0">
        <p class="cookie-text">{{ tr("COOKIE_USAGE") }}
          <a aria-label="learn more about cookies" class="read-more-link" target="_blank"
            href="https://www.partio.fi/suomen-partiolaiset/tietoa-meista/henkilotietojen-kasittely/tietosuojaseloste/">
            {{ tr("COOKIE_READ_MORE") }}</a>
        </p>
      </v-card-text>
      <!-- Dialog buttons -->
      <v-card-actions class="pa-0">
        <v-spacer></v-spacer>
        <v-btn :ripple="false" class="button--decline" variant="plain" @click="rejectCookies">
          <p>{{ tr("COOKIE_DENY") }}</p>
        </v-btn>
        <v-spacer></v-spacer>
        <v-btn :ripple="false" class="button--accept" variant="plain" @click="acceptCookies">
          <p>{{ tr("COOKIE_ACCEPT") }}</p>
        </v-btn>
        <v-spacer></v-spacer>
      </v-card-actions>
    </v-card>
  </v-dialog>
  <!-- Cookie button (opens the dialog) -->
  <v-row justify="end" class="pa-0 ma-0">
    <v-col cols="auto" class="pa-0 ma-0">
      <v-btn variant="elevated" @click="openDialog" text size="small" class="button--open-dialog">
        {{ tr("COOKIES") }}
      </v-btn>
    </v-col>
  </v-row>
</template>

<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { ref, onMounted } from 'vue';
import useSearchStore from "../store/search";
const store = useSearchStore();

const dialogOpen = ref<boolean>(false);

const acceptCookies = (): void => {
  store.setCookieConsent(true);
  closeDialog();
  window.location.reload();
};

const rejectCookies = (): void => {
  store.setCookieConsent(false);
  closeDialog();
  window.location.reload();
};

const openDialog = (): void => {
  dialogOpen.value = true;
};

const closeDialog = (): void => {
  dialogOpen.value = false;
};

onMounted(() => {
  if (!store.isConsentStored()) {
    openDialog();
  }
});

defineExpose({
  acceptCookies,
  rejectCookies,
  openDialog,
  closeDialog,
});
</script>
  
<style scoped>
@import url("../assets/styles.css");

.cookie-dialog {
  max-width: 30em;
}

.cookie-card {
  background-color: rgb(35, 39, 42);
  padding-left: 56px;
  padding-right: 56px;
  padding-top: 48px;
  padding-bottom: 48px;
  border-radius: 1.5rem !important;
}

.cookie-text {
  padding-bottom: 16px;
  color: white;
}

.read-more-link {
  color: lightgray;
}

.button--open-dialog {
  text-transform: unset !important;
  background-color: rgb(35, 39, 42);
  color: gray !important;
}

.button--decline {
  text-transform: unset !important;
  background-color: rgb(35, 39, 42);
  color: white !important;
  text-decoration: underline;
}

.button--accept {
  text-transform: unset !important;
  background-color: rgb(35, 39, 42);
  color: white !important;
  border: solid 2px;
  border-radius: 1.5rem;
  padding-left: 30px !important;
  padding-right: 30px !important;
}
</style>
