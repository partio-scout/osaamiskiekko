<template>
  <div class="sign-up">
    <div class="content">
      <h1 v-html="headingHtml" />

      <!-- <template v-if="submitted">
        <p>
          {{ content["thank-you"] }}
        </p>
      </template> -->

      <template>
        <div class="mt-5" v-html="content['normal-text']" />
        <br>
        <div class="button">
          <button class="btn btn-outlined-turquoise mt-3" @click="redirect">
            {{ content["button"] }}
          </button>
        </div>

        <!-- <p>* {{ content["special-text"] }}</p> -->

        <!-- <b-form class="sign-up-form mt-5" @submit.prevent="onSubmit">
          <div role="group" class="form-group">
            <label
              for="role-select"
              class="d-block"
            ><span aria-hidden="true">*</span>
              {{ content["role-label"] }}</label>
            <div>
              <select
                id="role-select"
                v-model="form.role"
                data-v-d4d17ad8=""
                required="required"
                aria-required="true"
                class="custom-select"
              >
                <option
                  v-for="role of roleOptions"
                  :key="role.text"
                  :value="role.value"
                >
                  {{ role.text }}
                </option>
              </select>
            </div>
          </div>

          <div role="group" class="form-group">
            <label
              for="subject-select"
              class="d-block"
            ><span aria-hidden="true">*</span>
              {{ content["subject-label"] }}</label>
            <div>
              <select
                id="subject-select"
                v-model="form.subject"
                required="required"
                aria-required="true"
                class="custom-select"
              >
                <option
                  v-for="subject of subjectOptions"
                  :key="subject.text"
                  :value="subject.value"
                >
                  {{ subject.text }}
                </option>
              </select>
            </div>
          </div>

          <div role="group" class="form-group">
            <label id="__BVID__35__BV_label_" for="name" class="d-block">
              <span aria-hidden="true">*</span>
              {{ content["name-label"] }}</label>
            <div>
              <input
                id="name"
                v-model.trim="form.name"
                type="text"
                :placeholder="content['name-label']"
                required="required"
                aria-required="true"
                class="form-control"
              >
            </div>
          </div>

          <div role="group" class="form-group">
            <label for="email" class="d-block">
              <span aria-hidden="true">*</span>
              {{ content["email-label"] }}</label>
            <div>
              <input
                id="email"
                v-model.trim="form.email"
                type="email"
                :placeholder="content['email-label']"
                required="required"
                aria-required="true"
                class="form-control"
              >
            </div>
          </div>

          <b-form-group :label="content['phone-label']" label-for="phone">
            <b-form-input id="phone" v-model="form.phone" type="text" />
          </b-form-group>

          <div role="group" class="form-group">
            <label for="message" class="d-block">
              <span aria-hidden="true">*</span>
              {{ content["message-label"] }}</label>
            <div>
              <textarea
                id="message"
                v-model.trim="form.message"
                required="required"
                rows="5"
                wrap="soft"
                aria-required="true"
                class="form-control"
                style="resize: none;"
                spellcheck="false"
              />
            </div>
          </div>

          <div class="submit-btn">
            <button type="submit" class="btn btn-outlined-turquoise mt-3">
              {{ content["submit"] }}
            </button>
          </div>
        </b-form> -->
      </template>
    </div>

    <!-- <footer>
      <div>
        <contact-info
          v-for="contact in contactInfoList"
          :key="contact.name"
          :item-data="contact"
        />
      </div>
    </footer> -->
  </div>
</template>

<script>
import Util from '~/assets/js/Util.js'

export default {
  components: { },
  async asyncData ({ $content, $config: { siteId } }) {
    const content = await $content('signup/signup-' + siteId).fetch()
    return {
      content
    }
  },

  data () {
    return {
      form: {
        role: null,
        subject: null,
        phone: null,
        email: '',
        name: '',
        message: ''
      },

      submitting: false,
      submitted: false,

      contactInfoList: [
        {
          name: 'Laura Kalervo',
          company: 'Osaamiskeskus Kentauri',
          email: 'laura.kalervo@kentauri.fi',
          phone: '+358 50 597 8190'
        }
      ]
    }
  },

  head () {
    return {
      title: this.$root.context.app.head.title + ' | ' + this.content.title
    }
  },

  computed: {
    roleOptions () {
      return (
        this.content && [
          {
            value: null,
            text: this.content['role-choice-0']
          },
          {
            value: this.content['role-choice-1'],
            text: this.content['role-choice-1']
          },
          {
            value: this.content['role-choice-2'],
            text: this.content['role-choice-2']
          },
          {
            value: this.content['role-choice-3'],
            text: this.content['role-choice-3']
          },
          {
            value: this.content['role-choice-4'],
            text: this.content['role-choice-4']
          }
        ]
      )
    },

    subjectOptions () {
      return (
        this.content && [
          {
            value: null,
            text: this.content['subject-choice-0']
          },
          {
            value: this.content['subject-choice-1'],
            text: this.content['subject-choice-1']
          },
          {
            value: this.content['subject-choice-2'],
            text: this.content['subject-choice-2']
          },
          {
            value: this.content['subject-choice-3'],
            text: this.content['subject-choice-3']
          },
          {
            value: this.content['subject-choice-4'],
            text: this.content['subject-choice-4']
          },
          {
            value: this.content['subject-choice-5'],
            text: this.content['subject-choice-5']
          }
        ]
      )
    },

    headingHtml () {
      return (
        this.content.heading &&
        Util.replaceTags(this.content.heading, {
          'highlight-start': '<span>',
          'highlight-end': '</span>'
        })
      )
    }
  },

  methods: {
    redirect () {
      window.location.href = 'https://link.webropolsurveys.com/S/1361750329159F5D'
    },

    async onSubmit () {
      if (this.submitting) {
        return
      }

      this.submitting = true

      // Set post data.
      // Note that if devMode is true, the sender (this.form.email) will receive the email.
      const postData = new URLSearchParams({
        role: this.form.role,
        subject: this.form.subject,
        name: this.form.name,
        email: this.form.email,
        phone: this.form.phone,
        message: this.form.message,
        devMode: this.$config.contact.devMode ? '1' : '0'
      })

      await fetch(this.$config.contact.url, {
        method: 'post',
        body: postData,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      })
        .then((response) => {
          if (response.ok === false) {
            throw new Error(response.statusText)
          }
          if (process.client) {
            window.scrollTo(0, 0)
          }
          this.submitting = false
          this.submitted = true
        })
        .catch(() => {
          this.submitting = false
          alert('Unknown Error')
        })
    }
  }
}
</script>

<style lang="scss">
.sign-up {
  .content {
    h1 {
      span {
        color: $turquoise-color;
      }
    }

    .sign-up-form {
      .form-group {
        .custom-select {
          text-transform: capitalize;
          border-radius: 0.5rem;
        }

        input {
          border-radius: 0.5rem;
        }
      }

      textarea.form-control {
        border-radius: 0.5rem;
      }
    }
  }
}
</style>

<style lang="scss" scoped>
$sign-up-width: 550px;

.sign-up {
  background: $background;

  .content {
    max-width: $sign-up-width;

    margin: 0 auto;
    padding: 3rem 2rem;

    p {
      margin: 4rem 0;
    }

    .submit-btn {
      @include media-breakpoint-down(sm) {
        button {
          width: 100%;
        }
      }
    }
  }

  footer {
    background: unset;

    & > div {
      padding: 12.3rem 2rem;
      margin: 0 auto;

      max-width: $sign-up-width;

      display: flex;
      justify-content: flex-start;

      @include media-breakpoint-down(sm) {
        flex-direction: column;
        align-items: flex-start;
        text-align: center;
      }

      .contact-info {
        width: 100%;

        @include media-breakpoint-down(sm) {
          margin: 3rem 0;
        }
      }
    }
  }
}
</style>
