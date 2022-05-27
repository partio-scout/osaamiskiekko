<template>
  <ul class="navigation-links-box">
    <li
      v-for="itemData in data"
      :key="itemData.text"
      :class="{
        'student-page': isStudentPage,
        'organization-page': !isStudentPage
      }"
    >
      <arrow-link
        :to="itemData.link"
        :is-external-link="itemData.isExternalLink"
      >
        {{ itemData.text }}
      </arrow-link>
    </li>
  </ul>
</template>

<script>
export default {
  props: ['isStudentPage'],

  data () {
    return {
      studentContent: null,
      schoolsAndOrganizationsContent: null,
      seeMoreLink1:
        'https://www.oph.fi/fi/koulutus-ja-tutkinnot/osaamisen-tunnistaminen-ja-tunnustaminen',
      seeMoreLink2:
        'https://www.ok-sivis.fi/tunnista-ja-tunnusta-osaaminen/osaamisen-tunnistaminen.html'
    }
  },

  async fetch () {
    const studentContent = await this.$content(
      'student/student-' + this.$config.siteId
    ).fetch()

    const schoolsAndOrganizationsContent = await this.$content(
      'schools-and-organizations/schools-and-organizations-' +
        this.$config.siteId
    ).fetch()

    this.studentContent = studentContent
    this.schoolsAndOrganizationsContent = schoolsAndOrganizationsContent
  },

  computed: {
    data () {
      return (
        this.studentContent &&
        this.schoolsAndOrganizationsContent && [
          {
            text: this.isStudentPage
              ? this.studentContent['part5-t1']
              : this.schoolsAndOrganizationsContent['part5-t1'],
            link: this.isStudentPage
              ? this.$urls.schoolsAndOrganizations
              : this.$urls.students,
            isExternalLink: false
          },

          { text: this.studentContent['part5-t2'], link: this.$urls.signUp },

          {
            text: this.studentContent['part5-t3'],
            link: this.$urls.searchForm,
            isExternalLink: false
          },

          {
            text: this.studentContent['part5-t4'],
            link: this.isStudentPage ? this.seeMoreLink1 : this.seeMoreLink2,
            isExternalLink: true
          }
        ]
      )
    }
  }
}
</script>

<style lang="scss" scoped>
.navigation-links-box {
  padding-left: 0;

  li {
    margin-bottom: 1rem;

    list-style: none;

    &.student-page:hover {
      ::v-deep .arrow-link {
        .left,
        .right {
          i,
          a {
            color: $milan-color;
          }
        }
      }
    }

    &.organization-page:hover {
      ::v-deep .arrow-link {
        .left,
        .right {
          i,
          a {
            color: $mauve-color;
          }
        }
      }
    }

    ::v-deep a {
      text-transform: uppercase;
      font-size: 1.5rem !important;
      font-family: $heading-font-family;
      color: inherit;
      text-decoration: none;
      letter-spacing: 0.09rem;

      width: 100%;
    }
  }
}
</style>
