<template>
  <div ref="degree" class="degree">
    <div class="part1">
      <div class="header-img">
        <img :src="randomHeaderImage" alt="">
      </div>

      <div class="content">
        <h1>
          <span class="school-name">{{ schoolName }}</span><br>
          <span class="academy-name">{{ academicDegreeName }}</span> <br>
          <span class="competence-name">{{ competenceName }}</span>
        </h1>
      </div>
    </div>
    <div class=" main-content">
      <aside ref="sticky-box" class="sticky">
        <div class="container">
          <div class="home-link">
            <nuxt-link :to="$urls.searchForm">
              <i class="fas fa-chevron-left" />
              {{ content["to-search-form-btn"] }}
            </nuxt-link>
          </div>

          <div class="links-box">
            <arrow-link
              v-for="(link, index) in linksBoxList"
              :key="index"
              :is-degree-page="link.isDegreePage"
              @click.native="scrollIntoView(link.name)"
            >
              {{ link.content }}
            </arrow-link>
          </div>

          <div class="back-to-search-btn">
            <button class="btn btn-blue" @click="$goTo('searchForm')">
              {{ content["to-search-form-btn"] }}
            </button>
          </div>
        </div>
      </aside>
      <div ref="body" class="body">
        <div class="part2">
          <div ref="part2" class="content">
            <h4>
              {{ content["part2-title"] }}
            </h4>

            <p>{{ detailsDescription }}</p>

            <arrow-link :is-external-link="true" :to="competenceDegree.url">
              {{ content["part2-seeMore"] }}
            </arrow-link>
          </div>
        </div>

        <div ref="part3" class="part3">
          <div class="content ">
            <h4>{{ academicDegreeName }}</h4>

            <div class="d-flex flex-xl-row flex-column mt-5 mb-5">
              <icon-list-item
                v-for="(itemData, index) in part3List"
                :key="index"
                class="list-item"
                :heading="itemData.heading"
                :icon="itemData.icon"
                :text="itemData.text"
              />
            </div>

            <h5>{{ content["qualification-description"] }}</h5>

            <p>
              {{ academicDegreeDescription }}
            </p>
          </div>
        </div>

        <div id="part4" ref="part4" class="part4">
          <div class="content">
            <h4>{{ competenceName }}</h4>

            <div class="d-flex flex-xl-row flex-column mt-5 mb-5">
              <icon-list-item
                v-for="(itemData, index) in part4List"
                :key="index"
                class="list-item"
                :heading="itemData.heading"
                :icon="itemData.icon"
                :text="itemData.text"
              />
            </div>

            <h5>{{ content["training-description"] }}</h5>

            <p>
              {{ competenceDegreeDescription }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  getCompetenceDegreeLink,
  getNqfs,
  getOrganizations,
  getSchools
} from '../../../../assets/js/old-api/Api'
import ArrowLink from '~/components/ArrowLink.vue'
import IconListItem from '~/components/IconListItem.vue'

export default {
  components: { ArrowLink, IconListItem },

  async asyncData ({ params, $content, $config: { siteId } }) {
    const { linkId } = params
    const degreesList = await getCompetenceDegreeLink(linkId)
    const degree = degreesList[0]
    const schoolsList = await getSchools()
    const nqfsList = await getNqfs()
    const organizationsList = await getOrganizations()

    const school = schoolsList.find(
      school => school.id === degree.academicdegree.school
    )

    const organization = organizationsList.find(
      organization => organization.id === degree.competence.organization
    )

    const academicLevel = nqfsList.find(
      item => item.id === degree.academicdegree.nqf
    )

    const competenceLevel = nqfsList.find(
      item => item.id === degree.competence.nqf
    )

    const content = await $content('details/details-' + siteId).fetch()

    return {
      competenceDegree: degree,
      school,
      academicLevel,
      competenceLevel,
      organization,
      content
    }
  },

  data () {
    return {
      part3List: [
        {
          heading: '',
          text: '',
          icon: 'fa-school'
        },
        {
          heading: '',
          text: '',
          icon: 'fa-stopwatch'
        },
        {
          heading: '',
          text: '',
          icon: 'fa-book'
        }
      ],

      part4List: [
        {
          heading: '',
          text: '',
          icon: 'fa-school'
        },
        {
          heading: '',
          text: '',
          icon: 'fa-stopwatch'
        },
        {
          heading: '',
          text: '',
          icon: 'fa-book'
        }
      ]
    }
  },

  head () {
    return {
      title:
        this.$root.context.app.head.title +
        ' | ' +
        this.schoolName +
        ', ' +
        this.academicDegreeName +
        ' | ' +
        this.competenceName
    }
  },

  computed: {
    siteId () {
      return this.$config.siteId
    },

    description () {
      return 'description_' + this.siteId
    },

    name () {
      return 'name_' + this.siteId
    },

    detailsDescription () {
      return this.competenceDegree && this.competenceDegree[this.description]
    },

    academicDegreeName () {
      return (
        this.competenceDegree && this.competenceDegree.academicdegree[this.name]
      )
    },

    competenceName () {
      return (
        this.competenceDegree && this.competenceDegree.competence[this.name]
      )
    },

    schoolName () {
      return this.school && this.school[this.name]
    },

    organizationName () {
      return this.organization && this.organization[this.name]
    },

    academicDegreeDescription () {
      return (
        this.competenceDegree &&
        this.competenceDegree.academicdegree[this.description]
      )
    },

    competenceDegreeDescription () {
      return (
        this.competenceDegree &&
        this.competenceDegree.competence[this.description]
      )
    },

    randomHeaderImage () {
      const pictures = [
        '/images/degree/Degree-car.png',
        '/images/degree/Degree-flamingo.png',
        '/images/degree/Degree-flower.png',
        '/images/degree/Degree-parrot.png',
        '/images/degree/Degree-tiger.png'
      ]

      const rand = Math.floor(Math.random() * pictures.length)
      return pictures[rand]
    },

    creditTranslation () {
      if (this.siteId === 'en') {
        return 'ECTS/competence points'
      } else if (this.siteId === 'sv') {
        return 'sp/kp'
      } else {
        return 'op/osp'
      }
    },

    linksBoxList () {
      return (
        this.content && [
          {
            name: 'part2',
            isDegreePage: true,
            content: this.content['box-link-1']
          },
          {
            name: 'part3',
            isDegreePage: true,
            content: this.content['box-link-2']
          },
          {
            name: 'part4',
            isDegreePage: true,
            content: this.content['box-link-3']
          }
        ]
      )
    }
  },

  mounted () {
    this.part3List[0].heading = this.content.institute
    this.part3List[1].heading = this.content.level
    this.part3List[2].heading = this.content.credits

    this.part3List[0].text = this.schoolName
    this.part3List[1].text = this.levelInformation(this.academicLevel)
    this.part3List[2].text = this.creditInformation(
      this.competenceDegree.academicdegree
    )

    this.part4List[0].heading = this.content['training-open-badge']
    this.part4List[1].heading = this.content.level
    this.part4List[2].heading = this.content.credits

    this.part4List[0].text = this.organizationName
    this.part4List[1].text = this.levelInformation(this.competenceLevel)
    this.part4List[2].text = this.creditInformation(
      this.competenceDegree.competence
    )
  },

  methods: {
    // Retrieve level information regarding academy or competence
    levelInformation (type) {
      return type ? type[this.name] + ` (NQF ${type.level})` : 'Not available'
    },

    // Retrieve credit information regarding academy or competence
    creditInformation (type) {
      return type.credits
        ? type.credits + ` ${this.creditTranslation}`
        : 'Not available'
    },

    scrollIntoView (name) {
      this.$refs[name].scrollIntoView()
    }
  }
}
</script>

<style lang="scss" scoped>
$degree-width: 1200px;
$padding-size: 2rem;

.degree {
  //Global css for .content
  background: #fff;

  .content {
    max-width: $degree-width;

    margin: 0 auto;
    padding: 4rem ($shared-padding + $padding-size);

    color: $black-color;

    @include media-breakpoint-down(lg) {
      max-width: unset !important;

      margin: unset !important;
      padding: 4rem $padding-size;
    }

    h4 {
      width: 80%;

      @include media-breakpoint-down(xs) {
        width: 100%;
      }
    }

    h5 {
      font-size: 1.1rem;
    }

    .list-item {
      flex: 1;

      padding-right: 1rem;

      &:last-child {
        padding-right: 0;
      }
    }
  }

  .part1 {
    position: relative;

    background: $background;

    .header-img {
      position: absolute;
      right: 0;
      bottom: 0;

      width: 40rem;

      img {
        max-width: 65%;

        @include media-breakpoint-down(lg) {
          max-width: 50%;
        }

        @include media-breakpoint-down(sm) {
          max-width: 35%;
        }

        float: right;
      }
    }

    .content {
      padding: 5rem (($shared-padding + $padding-size)) 7rem;

      @include media-breakpoint-down(lg) {
        width: 70%;

        padding: 1rem ($shared-padding) 7rem;
      }

      @include media-breakpoint-down(sm) {
        max-height: unset;
      }

      h1 {
        span {
          &.school-name {
            color: $theme-color-1;

            font-weight: 600;
            font-size: 1.1rem;

            display: inline-block;

            @include media-breakpoint-down(sm) {
              font-size: 1.2rem;
            }

            @include media-breakpoint-down(xs) {
              font-size: 1rem;
            }
          }

          &.academy-name,
          &.competence-name {
            @include media-breakpoint-down(md) {
              font-size: 1.75rem;
              line-height: 1.1;
            }
          }
        }

        -ms-hyphens: auto;
        -moz-hyphens: auto;
        -webkit-hyphens: auto;
        hyphens: auto;

        max-width: 61rem;

        word-break: break-word;

        font-weight: 700;
      }
    }
  }

  .main-content {
    max-width: $degree-width;

    margin: 0 auto;

    display: flex;
    justify-content: center;
    flex-direction: row-reverse;

    @include media-breakpoint-down(lg) {
      flex-direction: column;
    }

    .safari-sticky {
      position: absolute !important;
      top: 0 !important;

      @include media-breakpoint-down(lg) {
        position: unset !important;
        top: unset !important;
      }
    }

    .sticky {
      margin: 0;

      width: 40%;

      display: block;

      position: relative;

      @include media-breakpoint-down(lg) {
        width: 100%;
        height: auto;

        margin: 0 auto;
        padding: 0 $padding-size 3rem $padding-size;

        position: unset;
        left: unset;
        top: unset;

        transform: translateY(3rem);
      }

      .container {
        top: 3.75rem;
        position: sticky;
        z-index: 2;

        padding-top: 3rem;
        padding-bottom: 3.75rem;

        @include media-breakpoint-down(lg) {
          max-width: unset;

          padding: 0;
        }
      }

      .home-link {
        display: none;

        @include media-breakpoint-down(lg) {
          display: block;

          margin-bottom: 2rem;
          margin-top: -1rem;

          a {
            text-decoration: none;
            color: $black-color;
            font-weight: 600;
            font-size: 1.2rem;

            i {
              margin-right: 0.5rem;
            }
          }
        }
      }

      .links-box {
        padding: 2rem 3rem;

        background: $theme-color-1;

        @include media-breakpoint-down(lg) {
          background: $theme-color-2;

          // Style the children of this element using v-deep
          ::v-deep div {
            color: $theme-color-1 !important;
          }
        }

        ::v-deep div {
          color: #fff;

          .left {
            align-self: unset;
          }
        }
      }

      .back-to-search-btn {
        margin-top: 0.5rem;
        margin-bottom: 2rem;

        @include media-breakpoint-down(lg) {
          display: none;
        }

        button {
          width: 100%;

          border-radius: unset;
        }
      }
    }

    .body {
      position: relative;

      background: #fff;

      .part2 {
        .content {
          padding-top: 3rem;
          padding-bottom: 3rem;

          @include media-breakpoint-down(sm) {
            flex-direction: column;
            align-items: center;
          }

          & > div {
            color: $theme-color-1;
          }
        }
      }

      .part3 {
        position: relative;

        &::before {
          content: "";
          background-color: #eaefff;

          position: absolute;

          // 140% is the size of .main-content, doing this will
          // make the backdrop cover the whole width
          left: calc(-1 * (100vw - 140%) / 2);

          height: 100%;
          width: 100vw;

          @include media-breakpoint-down(lg) {
            left: unset;

            width: 100vw;
          }
        }

        .content {
          position: relative;
        }
      }

      .part4 {
        .content {
          p {
            white-space: pre-line;
          }
        }
      }

      .back-home-btn {
        margin-top: 3rem;
      }
    }
  }
}
</style>
