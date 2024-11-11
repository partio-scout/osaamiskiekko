/**
 * Logger plugin
 */

import { App, Plugin } from "vue";

/**
 * Prints a message with console.log
 */
const info = (msg: string): undefined | void => {
  if (import.meta.env.PROD) return;
  console.log(msg);
};

/**
 * Prints a message with console.error
 */
const error = (msg: string): undefined | void => {
  if (import.meta.env.PROD) return;
  console.error(msg);
};

const logger: Plugin = {
  install(app: App) {
    app.config.globalProperties.$info = info;
    app.config.globalProperties.$error = error;
    app.provide("info", info);
    app.provide("error", error);
  }
};

export default logger;
