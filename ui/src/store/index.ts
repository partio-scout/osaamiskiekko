import { createPinia } from "pinia";

export default createPinia();

import useAppStore from "./app";
import useApiStore from "./api";
import useHttpStore from "./http";
import useSearchStore from "./search";

export { useAppStore, useApiStore, useHttpStore, useSearchStore };
