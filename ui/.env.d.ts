/// <reference types="vite/client" />

interface ImportMetaEnv {
    readonly VITE_APP_VERSION: string;
    readonly VITE_API: string;
    // More env variables...
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
