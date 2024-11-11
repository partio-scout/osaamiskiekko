import { createI18n, useI18n } from "vue-i18n";
import fi from "../locales/fi";
import en from "../locales/en";
import sv from "../locales/sv";

const storedLanguage = localStorage.getItem("selectedLanguage");
const defaultLocale = storedLanguage || "fi";

const i18n = createI18n({
  locale: defaultLocale,
  legacy: false,
  messages: {
    fi: fi,
    en: en,
    sv: sv,
  },
});

export default i18n;
export const useTranslation = useI18n;
