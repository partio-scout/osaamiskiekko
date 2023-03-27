<template>
  <div class="page-container homepage">
    <header>
      <div class="content" :style="backgroundCSS">
        <div class="left">
          <h1>{{ content["header-heading"] }}</h1>
          <p>
            {{ content["header-content"] }}
          </p>

          <!-- <search-form /> -->
          <br>
          <div class="button">
            <button class="btn btn-outlined-blue" @click="pass">
              {{ content["body-part1-h2-2"] }}
            </button>
          </div>
        </div>

        <div class="right">
          <img :src="randomMobileHeaderImage" alt="">
        </div>
      </div>
    </header>

    <main>
      <page-section
        :is-header="false"
        class="part1"
        img-url="/images/osamiskiekko-broccoli.jpg"
        image-side="left"
        :image-alt="content['alt-osamiskiekko-broccoli']"
      >
        <h2>
          <p class="sub-heading">
            {{ content["body-part1-h1"] }}
          </p>
          {{ content["body-part1-h2"] }}
        </h2>

        <p class="blur-text">
          {{ content["body-part1-p1"] }}
        </p>
      </page-section>

      <page-section
        :is-header="false"
        class="part2"
        img-url="/images/osamiskiekko-water.jpg"
        image-side="right"
        :image-alt="content['alt-osamiskiekko-water']"
      >
        <h2>
          <p class="sub-heading">
            {{ content["body-part2-h1"] }}
          </p>
          {{ content["body-part2-h2"] }}
        </h2>

        <p class="blur-text">
          {{ content["body-part2-p1"] }}
        </p>
      </page-section>

      <page-section
        :is-header="false"
        class="part3"
        img-url="/images/osamiskiekko-flamingo.jpg"
        image-side="left"
        :image-alt="content['alt-osamiskiekko-flamingo']"
      >
        <h2>
          <p class="sub-heading">
            {{ content["body-part3-h1"] }}
          </p>
          {{ content["body-part3-h2"] }}
        </h2>

        <p class="blur-text">
          {{ content["body-part3-p1"] }}
        </p>

        <div class="button">
          <button class="btn btn-outlined-turquoise" @click="$goTo('signUp')">
            {{ content["body-part4-h2"] }}
          </button>
        </div>
      </page-section>

      <div class="category">
        <div>
          <category-item
            v-for="category in categoriesList"
            :key="category.title"
            :item-data="category"
          />
        </div>
      </div>
    </main>
  </div>
</template>

<script>
// import SearchForm from '../../components/SearchForm.vue'
import PageSection from '~/components/PageSection.vue'
import CategoryItem from '~/components/CategoryItem.vue'

export default {
  components: { PageSection, CategoryItem },

  async asyncData ({ $content, $config: { siteId } }) {
    const content = await $content('home/home-' + siteId).fetch()

    return {
      content
    }
  },

  data () {
    return {}
  },

  head () {
    return {
      title:
        this.$root.context.app.head.title +
        ' | ' +
        this.content['header-heading']
    }
  },

  computed: {
    categoriesList () {
      return [
        {
          imgUrl: '/images/icon_hakukone.png',
          title: this.content['category-1'],
          link: this.$urls.searchForm,
          hoverColor:
            process.client &&
            // Retrieve CSS variables
            window
              .getComputedStyle(document.documentElement)
              .getPropertyValue('--blusher-pink-color'),
          content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'
        },

        {
          imgUrl: '/images/icon_opiskelija.png',
          title: this.content['category-2'],
          link: this.$urls.students,
          hoverColor:
            process.client &&
            // Retrieve CSS variables
            window
              .getComputedStyle(document.documentElement)
              .getPropertyValue('--milan-color'),
          content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'
        },

        {
          imgUrl: '/images/icon_koulut.png',
          title: this.content['category-3'],
          link: this.$urls.schoolsAndOrganizations,
          hoverColor:
            process.client &&
            // Retrieve CSS variables
            window
              .getComputedStyle(document.documentElement)
              .getPropertyValue('--mauve-color'),
          content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'
        },

        {
          imgUrl: '/images/icon_tulemukaan.png',
          title: this.content['category-4'],
          link: this.$urls.signUp,
          hoverColor:
            process.client &&
            // Retrieve CSS variables
            window
              .getComputedStyle(document.documentElement)
              .getPropertyValue('--turquoise-color'),
          content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'
        }
      ]
    },

    randomDesktopHeaderImage () {
      const pictures = [
        '/images/1920-art.jpg',
        '/images/1920-food.jpg',
        '/images/1920-gardening.jpg',
        '/images/1920-music.jpg',
        '/images/1920-sport.jpg'
      ]

      const index = this.generateRandomNumber(pictures.length)
      return pictures[index]
    },

    randomMobileHeaderImage () {
      const pictures = [
        '/images/1000_header-food.png',
        '/images/1000_header-music.png',
        '/images/1000_header-sport.png',
        '/images/1000_header-art.png',
        '/images/1000_header-gardening.png'
      ]

      const index = this.generateRandomNumber(pictures.length)
      return pictures[index]
    },

    backgroundCSS () {
      return {
        background: `url(${this.randomDesktopHeaderImage})`,
        backgroundRepeat: 'no-repeat',
        backgroundSize: 'cover',
        backgroundPosition: '100% 58%'
      }
    }
  },

  methods: {
    generateRandomNumber (max) {
      return Math.floor(Math.random() * max)
    }
  }
}
</script>

<style lang="scss">
$header-height: 42rem;
$header-height-sm: 61rem;

.page-container.homepage {
  width: 100% !important;
  max-width: 100% !important;
  margin: 0 auto !important;
  overflow-x: hidden !important;
  position: relative !important;

  @include media-breakpoint-down(md) {
    background: $background;
  }

  header {
    width: 100vw;

    position: relative;
    z-index: 1;

    background: $black-color;

    .content {
      height: 66vh;
      min-height: 42rem;
      max-width: $content-width;

      margin: 0 auto;
      display: flex;

      @include media-breakpoint-down(md) {
        height: unset;
        min-height: unset;

        background: unset !important;

        flex-direction: column;
      }

      .left {
        position: relative;
        z-index: 2;

        max-width: 41%;

        padding: 8rem 0 12rem;

        transform: translateX(3.2rem);

        @include media-breakpoint-down(md) {
          margin: 0 auto;
          padding: 1rem 0 0rem;

          width: 91%;
          max-width: unset;

          transform: unset;
        }

        @include media-breakpoint-down(sm) {
          width: 87%;
        }

        @include media-breakpoint-down(xs) {
          width: 85%;
        }

        h1,
        p:not(.no-data) {
          text-shadow: 1px 1px black;
        }

        h1 {
          margin-bottom: 1.5rem;

          @include media-breakpoint-down(md) {
            font-size: 2.2rem;
          }
        }
      }

      .right {
        width: 40%;

        display: none;

        img {
          max-width: 45rem;

          transform: translateX(-25%);
        }

        @include media-breakpoint-down(md) {
          clip-path: inset(-100vw 0 -100vw -100vw);

          display: unset;
          width: 100%;

          img {
            width: 100%;
            max-width: 100% !important;

            transform: unset !important;
          }
        }
      }
    }
  }

  main {
    background: $background;

    .page-section {
      @include media-breakpoint-down(md) {
        text-align: center;
      }

      &.part1 {
        .sub-heading {
          color: $milan-color;
        }
      }

      &.part2 {
        .sub-heading {
          color: $mauve-color;
        }
      }

      &.part3 {
        .sub-heading {
          color: $turquoise-color;
        }

        .button {
          margin-top: 3rem;

          button {
            @include media-breakpoint-down(xs) {
              width: 100%;
            }
          }
        }
      }
    }

    .category {
      background: $background;

      & > div {
        margin: 0 auto;
        padding: 5rem 0;

        max-width: $nav-width;

        display: flex;
        justify-content: space-between;

        @include media-breakpoint-down(md) {
          flex-direction: column;
        }
      }
    }
  }
}
</style>
