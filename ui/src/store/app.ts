import { AppStore } from "@/interfaces/appStore";
import { defineStore } from "pinia";

interface SnackbarOptions {
  text: string;
  timeout?: number;
}

/**
 * Global store
 */
export default defineStore("app", {
  state: (): AppStore => ({
    APP_VERSION: import.meta.env.VITE_APP_VERSION,
    ENV: import.meta.env.VITE_USER_NODE_ENV,
    API: import.meta.env.VITE_API,
    snackbar: false,
    snackbarText: ""
  }),
  actions: {
    showSnackbar(options: SnackbarOptions): void {
      const timeout: number = 5000;

      // If open, close it so it can be opened again
      this.snackbar = false;

      this.snackbar = true;
      this.snackbarText = options?.text;

      setTimeout(
        () => {
          this.snackbar = false;
        },
        options.timeout ? options.timeout : timeout
      );
    },
    closeSnackbar(): void {
      this.snackbar = false;
    }
  }
});
