import { useTranslation } from "../plugins/vue-i18n";

/**
 * Finds a translation for a key
 */
export function tr(key: string): string {
  const { t } = useTranslation();
  return t(key);
}