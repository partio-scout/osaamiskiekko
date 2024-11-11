<template>
  <div
    class="navigation"
    :class="{ 'secondary-page-navigation': !isPrimaryPage }"
  >
    <nav class="desktop">
      <div class="logo-container">
        <div class="logo">
          <nuxt-link :to="$urls.home">
            <img
              role="link"
              aria-label="xxxMartinxxx - Go to Homepage"
              src="/images/logo/logo-osaamiskiekko-200.png"
              alt="Logo"
            >
          </nuxt-link>
        </div>
      </div>

      <div>
        <nuxt-link :to="$urls.home">
          {{ content["navbar-home"] }}
        </nuxt-link>
      </div>

      <div>
        <nuxt-link :to="$urls.students">
          {{ content["navbar-student"] }}
        </nuxt-link>
      </div>

      <div>
        <nuxt-link :to="$urls.schoolsAndOrganizations">
          {{ content["navbar-school"] }}
        </nuxt-link>
      </div>

      <div>
        <nuxt-link :to="$urls.signUp">
          {{ content["navbar-signup"] }}
        </nuxt-link>
      </div>

      <div class="language">
        <b-dropdown
          id="language-dropdown-btn"
          ref="language-dropdown-btn"
          :text="content.language"
          :class="languageCssClass"
        >
          <b-dropdown-item
            v-for="language in languagesList"
            :key="language.name"
            @click.native="reloadPage(language.path)"
          >
            <nuxt-link :to="getLanguageLink(language.path)">
              {{ language.name }}
            </nuxt-link>
          </b-dropdown-item>
        </b-dropdown>
      </div>
    </nav>

    <nav class="mobile">
      <div class="logo-container">
        <nuxt-link :to="$urls.home">
          <div class="logo">
            <img src="/images/logo/logo-osaamiskiekko-200.png" alt="">
          </div>
        </nuxt-link>
      </div>

      <div
        class="mobile-button"
        @click.prevent="toggleMobileMenuVisibilityClick()"
      >
        <div class="bar" />
        <div class="bar" />
        <div class="bar" />
      </div>

      <div v-show="isMobileMenuVisible" class="mobile-menu">
        <div>
          <nuxt-link
            class="blur-link"
            :to="$urls.home"
            @click.native="closeMenu()"
          >
            {{ content["navbar-home"] }}
          </nuxt-link>
        </div>

        <div>
          <nuxt-link
            class="blur-link"
            :to="$urls.students"
            @click.native="closeMenu()"
          >
            {{ content["navbar-student"] }}
          </nuxt-link>
        </div>

        <div>
          <nuxt-link
            class="blur-link"
            :to="$urls.schoolsAndOrganizations"
            @click.native="closeMenu()"
          >
            {{ content["navbar-school"] }}
          </nuxt-link>
        </div>

        <div>
          <nuxt-link
            class="blur-link"
            :to="$urls.signUp"
            @click.native="closeMenu()"
          >
            {{ content["navbar-signup"] }}
          </nuxt-link>
        </div>

        <div
          v-for="language in languagesList"
          :key="language.name"
          class="language-link"
        >
          <nuxt-link
            :to="getLanguageLink(language.path)"
            @click.native="reloadPage(language.path)"
          >
            {{ language.name }}
          </nuxt-link>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  data () {
    return {
      content: {},

      isMobileMenuVisible: false,
      isPrimaryPage: true,

      siteName: this.$route.name,

      languagesList: [
        { name: 'Suomeksi', path: '/fi' },
        { name: 'In English', path: '/en' },
        { name: 'På svenska', path: '/sv' }
      ]
    }
  },

  async fetch () {
    const content = await this.$content(
      'home/home-' + this.$config.siteId
    ).fetch()
    this.content = content
  },

  fetchOnServer: true,

  computed: {
    urlPath () {
      return this.$route.path.substring(3, this.$route.path.length)
    },

    languageCssClass () {
      return {
        en: this.$config.siteId === 'en',
        sv: this.$config.siteId === 'sv',
        fi: this.$config.siteId === 'fi'
      }
    }
  },

  watch: {
    $route (to, from) {
      const path = to.path
      this.chooseSiteName(path)
    }
  },

  mounted () {
    const path = this.$route.path
    this.chooseSiteName(path)

    if (this.$refs['language-dropdown-btn'] !== undefined) {
      // Close mobile menu
      document.addEventListener('click', (ev) => {
        const collapse = document.querySelector('.mobile-menu')
        const eventClass = ev.target.className

        // Check if the event target class name is not 'bar' either 'mobile-button'
        // then close the menu. Otherwise, every time we click it will
        // open and close the menu immediately
        if (
          collapse &&
          !collapse.contains(ev.target) &&
          eventClass !== 'mobile-button' &&
          eventClass !== 'bar'
        ) {
          this.isMobileMenuVisible = false
        }
      })
    }
  },

  methods: {
    chooseSiteName (path) {
      if (path.includes('student')) {
        this.isPrimaryPage = false
        this.siteName = 'student'
      } else if (path.includes('schools-and-organizations')) {
        this.isPrimaryPage = false
        this.siteName = 'schools-and-organizations'
      } else if (path.includes('sign-up')) {
        this.isPrimaryPage = true
        this.siteName = 'sign-up'
      } else {
        this.isPrimaryPage = true
        this.siteName = 'index'
      }
    },

    getLanguageLink (lang) {
      return lang + this.urlPath
    },

    reloadPage (rootPath) {
      location.href = rootPath + this.urlPath
    },

    toggleMobileMenuVisibilityClick () {
      this.isMobileMenuVisible = !this.isMobileMenuVisible
    },

    closeMenu () {
      this.isMobileMenuVisible = false
    },

    goToSignUpPage () {
      this.closeMenu()
      this.$goTo('signUp')()
    }
  }
}
</script>

<style lang="scss" scoped>
.navigation {
  background: $black-color;

  padding: 1.5rem 1rem;

  font-size: $nav-font-size;

  z-index: 1;

  @include media-breakpoint-down(md) {
    padding: 1.5rem 0;
  }

  .logo-container {
    width: 48%;

    .logo {
      width: 3rem;

      cursor: pointer;

      a {
        border-bottom: none;

        opacity: 1;
      }

      img {
        max-width: 100%;
      }
    }
  }

  nav {
    background: inherit;

    .nuxt-link-exact-active {
      border-bottom: 1px solid $menu-link;

      opacity: 1;
    }

    &.desktop {
      @include media-breakpoint-down(lg) {
        display: none;
      }

      display: flex;
      align-items: center;

      max-width: $nav-width;
      height: $nav-height;

      margin: 0 auto;

      & > div {
        padding: 0 3rem 0 $shared-padding;

        a {
          white-space: nowrap;

          text-decoration: none;
          color: $menu-link;
          font-size: 1.2rem; // was 0.9

          opacity: 0.6;

          padding: 0.2rem;

          @include a-all-selectors {
            opacity: 1;
          }
        }
      }
    }

    &.mobile {
      display: none;

      position: relative;

      .logo-container {
        padding: 1.1rem 0 1rem $shared-padding;
      }

      @include media-breakpoint-down(lg) {
        display: block;

        max-width: $nav-width;

        margin: 0 auto;
      }

      .mobile-button {
        position: absolute;
        top: 1.75rem;
        right: $shared-padding;
        z-index: 10;

        cursor: pointer;

        .bar {
          background: $body-color;

          margin: 6px 0;

          width: 2.5rem;
          height: 3px;

          border-radius: 5px;
        }
      }

      .mobile-menu {
        position: absolute;
        top: 5rem;
        right: 3.5vw;

        z-index: 10;

        display: flex;
        flex-direction: column;

        width: 92.5vw;

        padding: 3rem;

        background: #23272a;

        border-radius: $border-radius;

        @include media-breakpoint-down(md) {
          font-size: 1rem;
        }

        & > div {
          padding-bottom: 1.5rem;

          &:last-child {
            padding-bottom: 0;
          }

          a {
            color: $menu-link;
            text-decoration: none;

            @include a-all-selectors {
              opacity: 1;
            }
          }

          &.language-link {
            opacity: 0.6;
          }
        }
      }
    }
  }
}

.secondary-page-navigation {
  background: transparent !important;

  position: absolute !important;

  width: 100% !important;

  nav {
    &.desktop {
      background-color: unset !important;
    }
  }
}
</style>

<style lang="scss">
.navigation {
  .language {
    .dropdown {
      @include media-breakpoint-down(md) {
        flex-direction: column;
      }

      &.en {
        ul {
          transform: translate3d(-1.7rem, 0.875rem, 0rem) !important;
        }
      }

      &.sv {
        ul {
          transform: translate3d(-2.2rem, 0.875rem, 0rem) !important;
        }
      }

      &.fi {
        ul {
          transform: translate3d(-3rem, 0.875rem, 0rem) !important;
        }
      }

      .dropdown-toggle {
        letter-spacing: unset;
        font-size: $nav-font-size;
      }

      .dropdown-menu {
        margin-top: 1.5rem;

        border-radius: 15px;

        // min-width: 100%;
        min-width: 8rem;

        text-align: center;

        background: #23272a;

        @include media-breakpoint-down(md) {
          border: none;

          margin-top: unset;

          position: relative !important;

          transform: unset;
        }

        .dropdown-item {
          color: $menu-link;
          text-shadow: 1px 1px 1px $black-color;

          padding-left: 1rem;
          padding-right: 1rem;

          @include a-all-selectors {
            background: rgba($color: #fff, $alpha: 0.1);

            @include media-breakpoint-down(md) {
              background-color: unset;
              color: #fff;
            }
          }
        }
      }
    }
  }
}
</style>
