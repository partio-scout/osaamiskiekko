<template>
  <div class="search-form">
    <b-form @submit.prevent>
      <div
        class="input-container input-container-school"
        :class="inputSchoolCssClass"
      >
        <b-input-group ref="group-1">
          <div class="input-group-prepend">
            <div class="input-group-text">
              <b-icon aria-hidden="true" icon="search" />
            </div>
          </div>

          <b-form-input
            id="schoolInput"
            v-model="schoolOrOrganizationSearchText"
            required
            :placeholder="content['school-placeholder']"
            autocomplete="off"
            @keyup="onSchoolInputKeyPress"
            @click.prevent="onSchoolDropdownClick"
            @focus="onSchoolDropdownClick"
          />
        </b-input-group>

        <div v-show="isSchoolsDropdownOpen" class="selection-dropdown">
          <div v-if="isFilteredSchoolsListEmpty" class="schools-organizations">
            <!-- <li class="heading"> -->
            <h5 class="heading">
              {{ content["institutions"] }}
            </h5>
            <!-- </li> -->
            <ul>
              <li
                v-for="school in filteredSchoolsList"
                :key="'school-' + school.id"
                @click.prevent="onSchoolClick(school, $event)"
              >
                {{ modelName(school) }}
              </li>
            </ul>

            <div class="line-break" />

            <!-- <li class="heading"> -->
            <h5 class="heading">
              {{ content["organizations"] }}
            </h5>
            <!-- </li> -->
            <ul>
              <li
                v-for="organization in filteredOrganizationsList"
                :key="'organization-' + organization.id"
                @click.prevent="onSchoolClick(organization, $event)"
              >
                {{ modelName(organization) }}
              </li>
            </ul>
          </div>
          <div v-else>
            <ul>
              <li class="no-data">
                {{ content["no-data"] }}
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div
        v-show="selectedSchoolOrOrganization !== null"
        class="input-container input-container-qualification"
        :class="inputQualificationCssClass"
      >
        <b-input-group ref="group-2">
          <div class="input-group-prepend">
            <div
              class="input-group-text"
              :class="{ disabled: isSchoolInputTyped }"
            >
              <b-icon aria-hidden="true" icon="journal-bookmark" />
            </div>
          </div>

          <b-form-input
            id="qualificationInput"
            ref="qualificationInput"
            v-model="qualificationSearchText"
            required
            :placeholder="content['qualification-placeholder']"
            autocomplete="off"
            :disabled="isSchoolInputTyped"
            :class="{ disabled: isSchoolInputTyped }"
            @keyup="onQualificationInputKeyPress"
            @click.prevent="onQualificationDropdownClick"
          />
        </b-input-group>

        <div v-show="isQualificationsDropdownOpen" class="selection-dropdown">
          <div v-if="isFilteredQualificationsListEmpty" class="qualifications">
            <ul>
              <li
                v-for="qualificationItem in filteredQualificationsList"
                :key="qualificationItem.id"
                @click.prevent="onQualificationClick(qualificationItem, $event)"
              >
                {{ modelName(qualificationItem) }}
              </li>
            </ul>
          </div>
          <div v-else>
            <ul>
              <li class="no-data">
                {{ content["no-data"] }}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </b-form>

    <div v-show="isSearchResultOpen" class="search-result">
      <search-form-result-item
        v-for="(itemData, index) in searchFormResultDataList"
        :key="index"
        :item-data="itemData"
      />
    </div>

    <p
      v-show="!isSearchResultOpen"
      class="additional-text"
      v-html="additionalInfoText"
    />
  </div>
</template>

<script>
import {
  getCreditingInfosForCompetence,
  getCreditingInfosForDegree,
  getNqfs,
  getOrganizations,
  getSchools
} from '../assets/js/old-api/Api'
import SearchFormResultItem from './SearchFormResultItem.vue'
import Util from '~/assets/js/Util'

export default {
  components: { SearchFormResultItem },

  data () {
    return {
      content: {},

      schoolsList: [],
      organizationsList: [],

      schoolTypesList: [],

      schoolOrOrganizationSearchText: '',
      selectedSchoolOrOrganization: null,
      showAllSchoolsOrOrganizations: false,

      qualificationSearchText: '',
      selectedQualification: null,
      showAllQualifications: false,

      isSchoolsDropdownOpen: false,
      isQualificationsDropdownOpen: false,
      isSchoolInputTyped: false,
      isSearchResultOpen: false
    }
  },

  async fetch () {
    const content = await this.$content(
      'home/home-' + this.$config.siteId
    ).fetch()
    const schoolsList = await getSchools()
    const organizationsList = await getOrganizations()
    const nqfs = await getNqfs()

    this.content = content
    this.schoolsList = schoolsList
    this.organizationsList = organizationsList
    this.schoolTypesList = nqfs
  },

  fetchOnServer: true,

  computed: {
    /**
     * List of schools to be displayed in search form.
     * If a school has been selected in the dropdown, all schools are listed, so that the user can select another one.
     *
     * Same logic applies to filteredOrganizationsList()
     *
     * @returns []
     */
    filteredSchoolsList () {
      if (this.showAllSchoolsOrOrganizations === true) {
        return this.schoolsList
      }

      return this.schoolsList.filter(school =>
        this.modelName(school)
          .toLowerCase()
          .includes(this.schoolOrOrganizationSearchText.trim().toLowerCase())
      )
    },

    filteredOrganizationsList () {
      if (this.showAllSchoolsOrOrganizations === true) {
        return this.organizationsList
      }

      return this.organizationsList.filter(organization =>
        this.modelName(organization)
          .toLowerCase()
          .includes(this.schoolOrOrganizationSearchText.trim().toLowerCase())
      )
    },

    // List of qualifications to be displayed in search form
    filteredQualificationsList () {
      if (this.selectedSchoolOrOrganization === null) {
        return []
      }

      let qualificationsList

      if (this.isSchool === true) {
        this.schoolsList.forEach((school) => {
          if (school.id === this.selectedSchoolOrOrganization.id) {
            qualificationsList = school.academicdegrees
          }
        })
      } else {
        this.organizationsList.forEach((organization) => {
          if (organization.id === this.selectedSchoolOrOrganization.id) {
            qualificationsList = organization.competences
          }
        })
      }

      if (this.showAllQualifications === true) {
        return qualificationsList
      }

      if (this.qualificationSearchText.trim() !== '') {
        qualificationsList = qualificationsList.filter(qualification =>
          this.modelName(qualification)
            .toLowerCase()
            .includes(this.qualificationSearchText.trim().toLowerCase())
        )
      }

      return qualificationsList
    },

    searchFormResultDataList () {
      const list = []

      if (this.selectedQualification === null) {
        return list
      }

      if (this.isSchool) {
        const searchResult = getCreditingInfosForDegree(
          this.selectedQualification.id
        )

        for (const organization of this.organizationsList) {
          const structuredSearchResult = []
          const searchResultFiltered = searchResult.filter(
            item =>
              item.competence &&
              item.competence.organization === organization.id
          )

          if (searchResultFiltered.length !== 0) {
            structuredSearchResult.push(
              ...searchResultFiltered.map(result => ({
                text: this.modelName(result.competence),
                subText: '',
                type: 'competence-link',
                id: result.id
              }))
            )

            list.push({
              text: this.modelName(organization),
              type: 'heading',
              data: structuredSearchResult
            })
          }
        }
      } else {
        const searchResult = getCreditingInfosForCompetence(
          this.selectedQualification.id
        )

        for (const schoolType of this.schoolTypesList) {
          const structuredSearchResult = []
          const searchResultFiltered = searchResult.filter(
            item => item.academicdegree.nqf === schoolType.id
          )

          if (searchResultFiltered.length !== 0) {
            structuredSearchResult.push(
              ...searchResultFiltered.map(result => ({
                text: this.modelName(result.academicdegree),
                subText: this.getSchoolOrOrganizationName(
                  result.academicdegree.school
                ),
                type: 'academic-link',
                id: result.id
              }))
            )

            list.push({
              text: this.modelName(schoolType),
              type: 'heading',
              data: structuredSearchResult
            })
          }
        }
      }

      return list
    },

    isSchool () {
      return this.selectedSchoolOrOrganization.typed_id.includes('school')
    },

    isFilteredSchoolsListEmpty () {
      return (
        this.filteredSchoolsList.length !== 0 ||
        this.filteredOrganizationsList.length !== 0
      )
    },

    isFilteredQualificationsListEmpty () {
      return this.filteredQualificationsList.length !== 0
    },

    inputSchoolCssClass () {
      return {
        open: this.isSchoolsDropdownOpen
      }
    },

    inputQualificationCssClass () {
      return {
        open: this.isQualificationsDropdownOpen
      }
    },

    additionalInfoText () {
      return (
        this.content['search-additional-info'] &&
        Util.replaceTags(this.content['search-additional-info'], {
          'link-start': `<a class='signup-link' href='${this.$urls.signUp}'>`,
          'link-end': '</a>'
        })
      )
    }
  },

  mounted () {
    // Close the dropdown when clicking outside it
    document.addEventListener('click', this.onDocumentClick)
  },

  beforeDestroy () {
    document.removeEventListener('click', this.onDocumentClick)
  },

  methods: {
    modelName (model) {
      return model['name_' + this.$config.siteId]
    },

    onDocumentClick (ev) {
      const collapseSchool = document.querySelector('#schoolInput')

      if (
        collapseSchool &&
        !collapseSchool.contains(ev.target) &&
        this.isSchoolsDropdownOpen
      ) {
        this.isSchoolsDropdownOpen = false
      }

      const collapseQualification = document.querySelector(
        '#qualificationInput'
      )

      if (
        collapseQualification &&
        !collapseQualification.contains(ev.target) &&
        this.isQualificationsDropdownOpen
      ) {
        this.isQualificationsDropdownOpen = false
      }

      const collapseResult = document.querySelector('.search-result')
      if (this.isSearchResultOpen) {
        if (collapseResult && !collapseResult.contains(ev.target)) {
          // this.isSearchResultOpen = false
          console.log('close result')
        }
      }
    },

    getSchoolOrOrganizationName (id) {
      let model

      if (!this.isSchool) {
        model = this.schoolsList.find(school => school.id === id)
      } else {
        model = this.organizationsList.find(
          organization => organization.id === id
        )
      }

      return this.modelName(model)
    },

    onSchoolDropdownClick () {
      this.isSchoolsDropdownOpen = true
      this.isQualificationsDropdownOpen = false
      this.isSearchResultOpen = false
      this.showAllSchoolsOrOrganizations = true
      this.qualificationSearchText = ''
    },

    // When the school field receives keystroke,
    // the qualification filed will be empty
    onSchoolInputKeyPress (event) {
      this.isQualificationsDropdownOpen = false
      this.isSearchResultOpen = false
      this.showAllSchoolsOrOrganizations = false
      this.isSchoolInputTyped = true
    },

    onQualificationInputKeyPress (event) {
      this.isQualificationsDropdownOpen = true
      this.isSearchResultOpen = false
      this.showAllQualifications = false
    },

    // When choosing school or organization, it will receive the following data
    onSchoolClick (schoolOrOrganization, event) {
      this.selectedSchoolOrOrganization = schoolOrOrganization

      this.schoolOrOrganizationSearchText = event.target.innerText

      this.isSchoolsDropdownOpen = false

      this.isSchoolInputTyped = false

      this.$refs.qualificationInput.focus()
    },

    onQualificationDropdownClick () {
      this.isSchoolsDropdownOpen = false
      this.isQualificationsDropdownOpen = true
      this.isSearchResultOpen = false
      this.showAllQualifications = true
    },

    // When choosing qualification, it will receive the following data
    onQualificationClick (qualification, event) {
      this.selectedQualification = qualification
      this.qualificationSearchText = event.target.innerText

      this.isSchoolsDropdownOpen = false
      this.isQualificationsDropdownOpen = false
      this.isSearchResultOpen = true
    }
  }
}
</script>

<style lang="scss">
.search-form {
  form {
    width: 115%;

    display: flex;

    @include media-breakpoint-down(md) {
      flex-direction: column;

      width: 100%;

      .input-container-school {
        margin-bottom: 1rem;
      }
    }

    margin-top: 2rem;

    .input-container {
      width: 100%;

      position: relative;

      margin-right: 1rem;

      .input-group {
        margin-right: 1rem;

        width: $input-group-size;

        @include media-breakpoint-down(sm) {
          width: 100%;
        }

        .disabled {
          background: #e9ecef !important;

          cursor: not-allowed;
        }

        .input-group-prepend {
          .input-group-text {
            background: #fff;

            border: unset;
          }

          &.bookmark {
            @include media-breakpoint-down(sm) {
              border-left: unset;
            }
          }
        }

        .input-group-append {
          button {
            border: unset;

            background: $theme-color-1;

            color: #fff;
            font-family: $heading-font-family;

            padding: 1rem 3rem;

            border-radius: 0 1.5rem 1.5rem 0;
          }
        }

        .form-control {
          border-width: 0px;

          height: auto;

          padding: 0.9rem 0;

          &:focus {
            box-shadow: unset;
          }
        }
      }

      .selection-dropdown {
        color: #405057;

        width: 100%;

        position: absolute;
        z-index: 1;

        & > div {
          max-height: 16rem;
          width: $input-group-size;

          overflow-y: scroll;
          overflow-x: hidden;

          border-radius: 0 0 1.5rem 1.5rem;
          border: 1px solid #fff;

          flex: 1;

          padding: 1rem;

          background: #fff;

          @include media-breakpoint-down(md) {
            max-width: 100%;
          }

          ul {
            list-style: none;

            padding: 0;

            li:not(.no-data) {
              padding: 0.4rem 0;

              &.heading {
                @include a-all-selectors {
                  cursor: default !important;
                  background: unset !important;
                }
              }

              @include a-all-selectors {
                background: #ccc;
                cursor: pointer;
              }
            }
          }
        }

        .qualifications {
          @include media-breakpoint-down(md) {
            margin-left: unset;
          }
        }
      }

      &.open {
        .input-group-text {
          border-radius: 1.5rem 0 0 0;
        }

        input {
          border-radius: 0 1.5rem 0 0;
        }
      }

      &:not(.open) {
        .input-group-text {
          border-radius: 1.5rem 0 0 1.5rem;
        }

        input {
          border-radius: 0 1.5rem 1.5rem 0;
        }
      }
    }
  }

  .search-result {
    position: absolute;

    max-height: 16rem;
    width: 112%;

    overflow-y: scroll;

    border-radius: 1.5rem;

    padding: 2rem 1rem;
    margin-top: 1rem;

    background: #fff;
    color: $black-color;

    @include media-breakpoint-down(md) {
      width: 100%;
    }
  }

  .additional-text {
    margin-top: 3rem;

    color: $menu-link;
    font-size: 0.8rem;

    @include media-breakpoint-down(md) {
      margin: 1rem 0 -2rem;
    }

    .signup-link {
      text-decoration: unset;
      color: $turquoise-color;
    }
  }
}
</style>
