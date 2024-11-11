import { ref } from 'vue';
import i18n from '../plugins/vue-i18n';

const LANGUAGE_KEY = 'selectedLanguage';

export function useLanguageSwitcher() {
  const currentLanguage = ref(localStorage.getItem(LANGUAGE_KEY) || i18n.global.locale.value);

  function changeLanguage(language: string) {
    i18n.global.locale.value = language as typeof i18n.global.locale.value;
    currentLanguage.value = language;
    localStorage.setItem(LANGUAGE_KEY, language);
  }

  return {
    currentLanguage,
    changeLanguage,
  };
}
