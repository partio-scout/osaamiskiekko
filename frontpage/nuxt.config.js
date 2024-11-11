import configLocal from './config/public/config.local.json'
import configDevelopment from './config/public/config.development.json'
import configProduction from './config/public/config.production.json'
import siteList from './config/public/site-list.json'

const installation = process.env.INSTALLATION
  ? process.env.INSTALLATION
  : 'local'

let publicRuntimeConfig

if (installation === 'development') {
  publicRuntimeConfig = configDevelopment
} else if (installation === 'production') {
  publicRuntimeConfig = configProduction
} else {
  publicRuntimeConfig = configLocal
}

export default {
  // Disable server-side rendering, if not on Netlify.
  // We don't want ssr in the development environment, because it's slow.
  // See: https://go.nuxtjs.dev/ssr-mode
  // ssr: true,
  ssr: process.env.NETLIFY !== undefined,

  // Target: https://go.nuxtjs.dev/config-target
  target: 'static',

  // See: https://nuxtjs.org/faq/netlify-deployment/
  generate: {
    fallback: true
  },

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Osaamiskiekko',
    htmlAttrs: {
      // `lang` expects the language id, not the country id.
      // The first part of e.g. sv_se is the language id.
      // lang: site.localeId.substr(0, 2)
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
      { property: 'og:image', content: '/images/og/og-image.jpeg' },
      { property: 'og:image:width', content: '1200' },
      { property: 'og:image:height', content: '630' }
    ],

    link: [
      { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
      {
        href:
          'https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700;800;900&family=Poppins:wght@600;700;800;900&display=swap',
        rel: 'stylesheet'
      },
      { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
      {
        rel: 'stylesheet',
        href:
          'https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.css'
      },
      {
        rel: 'stylesheet',
        href:
          'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css',
        integrity:
          'sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==',
        crossorigin: 'anonymous',
        referrerpolicy: 'no-referrer'
      },

      // Favicon, generated with http://www.favicomatic.com/
      // mstile images removed.
      // See also: http://stackoverflow.com/a/23851464
      { rel: 'apple-touch-icon-precomposed', sizes: '57x57', href: '/images/favicon/apple-touch-icon-57x57.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '114x114', href: '/images/favicon/apple-touch-icon-114x114.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '72x72', href: '/images/favicon/apple-touch-icon-72x72.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '144x144', href: '/images/favicon/apple-touch-icon-144x144.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '60x60', href: '/images/favicon/apple-touch-icon-60x60.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '120x120', href: '/images/favicon/apple-touch-icon-120x120.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '76x76', href: '/images/favicon/apple-touch-icon-76x76.png' },
      { rel: 'apple-touch-icon-precomposed', sizes: '152x152', href: '/images/favicon/apple-touch-icon-152x152.png' },
      { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/images/favicon/favicon-32x32.png' },
      { rel: 'icon', type: 'image/png', sizes: '196x196', href: '/images/favicon/favicon-196x196.png' },
      { rel: 'icon', type: 'image/png', sizes: '96x96', href: '/images/favicon/favicon-96x96.png' },
      { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/images/favicon/favicon-16x16.png' },
      { rel: 'icon', type: 'image/png', sizes: '128x128', href: '/images/favicon/favicon-128.png' }
    ],
    script: [
      // See: https://github.com/osano/cookieconsent
      {
        src:
          'https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.js',
        'data-cfasync': false
      }
    ]
  },

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '~/plugins/filters.js',
    '~plugins/setSite.js',
    '~plugins/urls.js',
    { src: '~plugins/moment.js' },
    { src: '~plugins/cookieConsent.js', mode: 'client' }, // Must be before Google Analytics and Facebook Pixel
    { src: '~plugins/googleAnalytics.js', mode: 'client' },
    { src: '~plugins/facebookPixel.js', mode: 'client' }
  ],

  // Runtime configuration
  // See: https://nuxtjs.org/docs/2.x/directory-structure/nuxt-config#runtimeconfig
  publicRuntimeConfig,

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module'
  ],

  eslint: {
    fix: true
  },

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // Doc: https://bootstrap-vue.js.org
    ['bootstrap-vue/nuxt', { icons: true }],

    // Doc: https://github.com/nuxt-community/style-resources-module
    '@nuxtjs/style-resources',
    // Doc: https://content.nuxtjs.org
    '@nuxt/content',
    '@nuxtjs/axios'
  ],

  // Bootstrap Vue configuration.
  // Exclude the CSS so that we can replace it with our compiled version.
  bootstrapVue: {
    bootstrapCSS: false,
    bootstrapVueCSS: false
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  // This files compiles Bootstrap with our overridden variables.
  css: ['@/assets/scss/_bootstrap.scss'],

  // @nuxtjs/style-resources configuration
  // Doc: https://github.com/nuxt-community/style-resources-module
  //
  // This module will import the below scss files in all of our scss files,
  // so that we don't need to import them separately.
  styleResources: {
    scss: [
      // Import bootstrap files including our own bootstrap overrides.
      '~/assets/scss/_bootstrap-overrides.scss',
      'bootstrap/scss/_functions.scss',
      'bootstrap/scss/_variables.scss',
      'bootstrap/scss/_mixins.scss',

      // Include our own variables and mixins, etc.
      '~/assets/scss/_variables.scss',
      '~/assets/scss/_mixins.scss'
    ],
    hoistUseStatements: true
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    // We'll use separate CSS files so that the html is not cluttered.
    // This is good for the front page, which should be SEO friendly.
    // https://nuxtjs.org/api/configuration-build/#extractcss
    extractCSS: process.env.NETLIFY !== undefined
  },

  router: {
    // Extend the routes.
    // See: https://nuxtjs.org/docs/features/file-system-routing
    extendRoutes(routes, resolve) {
      const pagesToIndexList = ['index', 'schools-and-organizations', 'sign-up', 'students']

      for (const siteId in siteList) {
        for (const page of pagesToIndexList) {
          const name = siteId + '-' + page

          let path = '/' + siteId + '/' + page + '/'

          if (page === 'index') {
            path = '/' + siteId + '/'
          }

          routes.push({
            name,
            path,
            component: resolve(__dirname, 'pages/_siteId/' + page + '.vue')
          })
        }
      }
    }
  }
}
