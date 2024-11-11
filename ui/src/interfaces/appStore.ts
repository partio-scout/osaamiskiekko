export interface AppStore {
  /**
   * Application version number from the environment variable
   */
  APP_VERSION: string | undefined;
  /**
   * Environment
   */
  ENV: string | undefined;
  /**
   * API URL
   */
  API: string | undefined;
  /**
   * Snackbar status
   */
  snackbar: boolean;
  /**
   * Text displayed in the snackbar
   */
  snackbarText: string;
}
