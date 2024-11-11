import { loadFonts } from './webfontloader';
import vuetify from './vuetify';
import i18n from "./vue-i18n";
import logger from "./logger";
import pinia from '../store';
import router from '../router';
import { autoAnimatePlugin } from '@formkit/auto-animate/vue';
import VueGtag from "vue-gtag";

// Types
import type { App } from 'vue';

// Google Analytics ID
const GA_MEASUREMENT_ID = "G-TGN8ZH50Q6";

export function registerPlugins(app: App) {
  loadFonts();
  app
    .use(vuetify)
    .use(i18n)
    .use(logger)
    .use(router)
    .use(pinia)
    .use(autoAnimatePlugin);
}

export function enableAnalytics(app: App, enableAnalytics: boolean) {
  if (enableAnalytics) {
    app.use(VueGtag, {
      config: { id: GA_MEASUREMENT_ID },
      params: {
        anonymize_ip: true
      }
    });
  }
}