import { createApp } from 'vue';
import App from './App.vue';
import { registerPlugins, enableAnalytics } from '@/plugins';
import useSearchStore from "./store/search";
// import consentGiven from './components/CookieConsent.vue';

const app = createApp(App);

registerPlugins(app);
const store = useSearchStore();
enableAnalytics(app, store.cookieConsent);
console.log(store.cookieConsent)

app.mount('#app');