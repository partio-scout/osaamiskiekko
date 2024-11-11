/**
 * Logger which prints messages in a development environment.
 */

import { inject, onMounted } from "vue";

/**
 * The injected info function.
 */
let i: any;
/**
 * The injected error function.
 */
let e: any;

/**
 * Injects the logger functions to variables.
 */
export function useLogger() {
  onMounted(() => {
    i = inject("info");
    e = inject("error");
  });
}

/**
 * Prints a message with console.log
 */
export function info(msg: any): undefined | void {
  return i(msg);
}

/**
 * Prints a message with console.error
 */
export function error(msg: any): undefined | void {
  return e(msg);
}
