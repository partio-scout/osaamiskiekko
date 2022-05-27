/**
 * Cookie consent.
 *
 * Cookie consent is denied by default.
 *
 *
 * 1. For Facebook, cookies are allowed / denied in the initialization scripts.
 * Facebook uses third-party cookies.
 *
 * 2. For Google Analytics and Ads, cookies are allowed / denied in the initialization scripts.
 * Google Analytics uses first-party cookies.
 * Google Ads is used via Google Analytics, i.e. there's no Google Ads code in this software.
 *
 * How to test Google Analytics:
 *
 * However, these cookieless hits are sent to Google Analytics with a new gcs parameter,
 * which includes the consent status of the hit. The cookieless hits are thus identified by Google Analytics
 * and for now are not collected or exposed in reporting at all."
 *
 *  "With GCS=G100 you have denied analytics storage and thus the data won't be available in reports (for now)."
 *
 *
 * When the user allows / denies cookies in the popup, the change will take effect in the next page request.
 * So that it also takes effect in the current JavaScript code, a gtag() and fbq() call is also made
 * in this component, and cookies are also deleted. See updateCookieConsent().
 *
 * See:
 *  https://www.osano.com/cookieconsent/download/
 *  https://www.osano.com/cookieconsent/documentation/about-cookie-consent/
 *
 *  https://developers.google.com/gtagjs/devguide/consent
 *  https://developers.google.com/analytics/devguides/collection/analyticsjs/cookie-usage
 *
 *  https://developers.facebook.com/docs/facebook-pixel/implementation/gdpr/
 */
export default async ({ app }, inject) => {
  if (process.server) {
    return
  }

  // This function is called, when the users allows / denies cookies.
  // It allows / denies cookies in Google Analytics and Ads with a gtag() call,
  // and in Facebook with a fbq() call.
  const updateCookieConsent = (allow) => {
    if (window.gtag !== undefined) {
      window.gtag('consent', 'update', {
        ad_storage: allow ? 'granted' : 'denied',
        analytics_storage: allow ? 'granted' : 'denied'
      })
    }

    if (window.fbq !== undefined) {
      window.fbq('consent', allow ? 'grant' : 'revoke')
    }

    if (allow === false) {
      // If cookies are denied, delete any existing cookies, except for those listed in cookieAllowedList.
      //
      // Facebook will delete all its third-party cookies.
      // Before, it seemed that Facebook did not use first-party cookies, but as of 2021 Aug we noticed that it uses.
      //
      // Google Analytics should only use first-party cookies.
      // See: https://developers.google.com/analytics/devguides/collection/analyticsjs/cookie-usage
      const cookieAllowedList = ['cookieconsent_status']

      const cookieStrList = document.cookie.split(';')

      for (const cookieStr of cookieStrList) {
        const a = cookieStr.split('=')
        const cookieName = a[0].trim()

        for (const cookieAllowedName of cookieAllowedList) {
          const regex = new RegExp(cookieAllowedName)

          if (regex.test(cookieName) === false) {
            document.cookie =
              cookieName +
              '=;' +
              'expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/;domain=' +
              window.location.hostname
            document.cookie =
              cookieName +
              '=;' +
              'expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/;domain=.' +
              window.location.hostname
          }
        }
      }
    }
  }

  const content = await app
    .$content('cookiesConsent/cookies-' + app.$config.siteId)
    .fetch()
  // Initialize cookie consent popup.
  window.cookieconsent.initialise({
    palette: {
      popup: {
        background: '#23272A',
        text: '#ffffff',
        outline: 'none'
      },
      button: {
        background: 'transparent',
        text: '#ffffff',
        border: '#ffffff'
      }
    },
    position: 'bottom-right',
    type: 'opt-out',
    content: {
      message: content.message,
      allow: content.allow,
      deny: content.deny,
      link: content.link,
      policy: content.policy,
      href: 'https://www.partio.fi/suomen-partiolaiset/tietoa-meista/henkilotietojen-kasittely/tietosuojaseloste/'
    },
    law: {
      countryCode: 'FI'
    },
    /* eslint-disable */
    onStatusChange: function (status) {
      updateCookieConsent(this.hasConsented());
    }
    /* eslint-enable */
  })

  // Define hasConsent function.
  const hasConsent = () => {
    return (
      window.cookieconsent.utils.getCookie('cookieconsent_status') === 'allow'
    )
  }

  // Inject $cookieConsent in Vue, context and store.
  inject('cookieConsent', {
    hasConsent
  })
}
