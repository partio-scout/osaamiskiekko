<template>
  <footer id="main-footer" class="main-footer">
    <div>
      <div class="left">
        <div class="info">
          <h3>{{ content["brand"] }}</h3>
          <p v-html="footerTextHtml" />
        </div>

        <div class="links">
          <div>
            <nuxt-link :to="$urls.home">
              {{ content["home"] }}
            </nuxt-link>
          </div>

          <div>
            <nuxt-link :to="$urls.students">
              {{ content["student"] }}
            </nuxt-link>
          </div>

          <div>
            <nuxt-link :to="$urls.schoolsAndOrganizations">
              {{ content["school"] }}
            </nuxt-link>
          </div>

          <div>
            <nuxt-link :to="$urls.signUp">
              {{ content["signup"] }}
            </nuxt-link>
          </div>

          <!-- <div>
            <a
              target="_blank"
              href="https://link.webropolsurveys.com/Participation/Public/43bf4835-3f8d-4250-8bee-888d3719be70?displayId=Fin2412610"
            >
              {{ content["giveFeedback"] }}
            </a>
          </div> -->

          <div>
            <nuxt-link :to="$urls.privacyPolicy">
              {{ content["privacy-policy"] }}
            </nuxt-link>
          </div>

          <div>
            <nuxt-link :to="$urls.accessibility">
              {{ content["accessibility"] }}
            </nuxt-link>
          </div>
        </div>
      </div>

      <div class="right">
        <div class="logos">
          <div class="logo kentauri">
            <a href="https://kentauri.fi/" target="_blank">
              <img
                role="link"
                src="/images/logo/Kentauri-logo.png"
                :alt="content['alt-link-kentauri']"
              >
            </a>
          </div>

          <div class="logo">
            <a target="_blank" href="https://okm.fi/">
              <img
                role="link"
                src="/images/logo/OKM-logo.png"
                :alt="content['alt-link-okm']"
              >
            </a>
          </div>

          <div class="logo monkeys">
            <a target="_blank" href="https://www.10monkeysdigital.com/">
              <img
                role="link"
                src="/images/logo/10monkeys-logo.png"
                :alt="content['alt-link-10monkeys']"
              >
            </a>
          </div>

          <div class="logo vxt">
            <a target="_blank" href="https://www.vxt-research.com/">
              <img
                role="link"
                src="/images/logo/VXT-logo.png"
                :alt="content['alt-link-vxt']"
              >
            </a>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
import Util from '~/assets/js/Util.js'

export default {
  data () {
    return {
      mobileMenuVisible: false,
      content: {}
    }
  },

  async fetch () {
    const content = await this.$content(
      'footer/footer-' + this.$config.siteId
    ).fetch()
    this.content = content
  },

  fetchOnServer: true,

  computed: {
    footerTextHtml () {
      return (
        this.content['footer-text'] &&
        Util.replaceTags(this.content['footer-text'], {
          'link-start':
            "<a target='_blank' href='https://www.10monkeysdigital.com/'>",
          'link-end': '</a>'
        })
      )
    }
  }
}
</script>

<style lang="scss">
.main-footer {
  margin: 0 auto;

  background: $background;

  h3 {
    font-size: 1.1rem;
  }

  & > div:first-child {
    display: flex;
    justify-content: space-between;

    max-width: $nav-width;

    padding: 4rem 4rem 3rem 3rem;
    margin: 0 auto;

    @include media-breakpoint-down(md) {
      padding: 4rem 2rem;
      margin: unset;
    }

    @include media-breakpoint-down(lg) {
      flex-direction: column;
    }

    .left {
      display: flex;
      flex: 1;

      margin-bottom: 3rem;

      @include media-breakpoint-down(sm) {
        flex-direction: column;
        align-items: center;
        text-align: center;
      }

      .info {
        width: 41%;

        @include media-breakpoint-down(sm) {
          width: 64%;
        }

        @include media-breakpoint-down(xs) {
          width: 100%;
        }

        h3 {
          font-size: 1.42rem; // was 1.1
        }

        p {
          opacity: 0.6;

          font-size: 1.2rem; // was 0.9
          line-height: 1.8;

          a {
            color: unset;
          }
        }
      }

      .links {
        padding-left: 16%;

        @include media-breakpoint-down(sm) {
          padding: 3rem 0 0rem 0;
        }

        & > div {
          padding-bottom: 1.2rem;

          a {
            color: inherit;
            font-size: 1.2rem; // was 0.9
            text-decoration: none;

            opacity: 0.6;

            &:hover {
              opacity: 1;
              text-decoration: underline;
            }
          }
        }
      }
    }

    .right {
      width: 23rem;

      @include media-breakpoint-down(lg) {
        width: unset;
      }

      @include media-breakpoint-down(sm) {
        padding-left: 0;

        flex: 1;
      }

      @include media-breakpoint-down(xs) {
        min-width: 54%;
        max-width: unset;
      }

      .links {
        width: 77%;

        @include media-breakpoint-down(sm) {
          width: 41%;

          margin-right: 3rem;
        }
      }

      .logos {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;

        transform: translateX(1rem);

        @include media-breakpoint-down(md) {
          transform: unset;
        }

        @include media-breakpoint-down(sm) {
          justify-content: space-between;

          padding-top: 2rem;
        }

        .logo {
          width: 10rem;

          margin: 0 1.5rem 1rem 0;

          @include media-breakpoint-down(sm) {
            width: 8rem;
          }

          &:last-child {
            padding-right: 0 !important;
          }

          &.monkeys {
            width: 3.9rem;
          }

          &.vxt {
            width: 3.9rem;
          }

          &.kentauri {
            transform: translateX(-1.1rem) translateY(-1.1rem);
          }
        }

        img {
          max-width: 100%;
        }
      }
    }
  }
}
</style>
