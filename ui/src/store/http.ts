import { defineStore } from "pinia";
import { useAppStore } from "@/store";

import axios, { AxiosResponse } from "axios";
import { HttpRequestOptions } from "@/interfaces/httpRequestOptions";

/**
 * HTTP store
 */
export default defineStore("http", {
  actions: {
    /**
     * HTTP GET
     */
    get: (opts: HttpRequestOptions): Promise<AxiosResponse> => {
      const appStore = useAppStore();
      let path: string = `${appStore.API}/${opts.path}`;
      if (opts.query) path = path + "?filter=" + encodeURIComponent(JSON.stringify(opts.query));
      return axios.get(path, opts.payload ? opts.payload : undefined);
    },
    /**
     * HTTP PUT
     */
    put: (opts: HttpRequestOptions): Promise<AxiosResponse> => {
      const appStore = useAppStore();
      const path: string = `${appStore.API}/${opts.path}`;
      return axios.put(path, opts.payload ? opts.payload : undefined);
    },
    /**
     * HTTP PATCH
     */
    patch: (opts: HttpRequestOptions): Promise<AxiosResponse> => {
      const appStore = useAppStore();
      const path: string = `${appStore.API}/${opts.path}`;
      return axios.patch(path, opts.payload ? opts.payload : undefined);
    },
    /**
     * HTTP POST
     */
    post: (opts: HttpRequestOptions): Promise<AxiosResponse> => {
      const appStore = useAppStore();
      const path: string = `${appStore.API}/${opts.path}`;
      return axios.post(
        path,
        opts.payload ? opts.payload : undefined,
        opts.headers
          ? {
              headers: opts.headers
            }
          : undefined
      );
    },
    /**
     * HTTP DELETE
     */
    delete: (opts: HttpRequestOptions): Promise<AxiosResponse> => {
      const appStore = useAppStore();
      const path: string = `${appStore.API}/${opts.path}`;
      return axios.delete(
        path,
        opts.payload
          ? {
              data: opts.payload
            }
          : undefined
      );
    }
  }
});
