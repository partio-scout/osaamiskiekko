/**
 * Google Analytics integration (GA4).
 *
 * We don't use Google Tag Manager, because it's easier to integrate Google Analytics advanced features directly.
 * Though, the Google Analytics tracking code is a custom version of Google Tag Manager code.
 *
 * See: cookieConsent.js
 *
 * @param app
 * @param inject
 */
export default ({ app }, inject) => {
  // Get tracking ID.
  const trackingId = app.$config.googleAnalyticsTrackingId

  if (trackingId !== '') {
    // Initialize Google Analytics.
    const tag = document.createElement('script')
    tag.src = 'https://www.googletagmanager.com/gtag/js?id=' + trackingId
    tag.async = true
    const firstScriptTag = document.getElementsByTagName('script')[0]
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

    window.dataLayer = window.dataLayer || []
    const gtag = function () {
      window.dataLayer.push(arguments)
    }
    window.gtag = gtag

    const hasConsent = app.$cookieConsent.hasConsent()

    // By default deny any cookies.
    // NOTE! In the docs it says that "allowed" is the parameter, but it does not work! It should be "granted".
    gtag('consent', 'default', {
      ad_storage: hasConsent ? 'granted' : 'denied',
      analytics_storage: hasConsent ? 'granted' : 'denied',
      wait_for_update: 500 // Wait for CookieConsent to exist.
    })

    gtag('js', new Date())

    gtag('config', trackingId, {
      // Don't send the query string.
      page_location: location.host + location.pathname
    })

    // On each route change, send a page view.
    // See: https://developers.google.com/analytics/devguides/collection/ga4/page-view
    app.router.afterEach((to, from) => {
      if (window.gtag === undefined) {
        return
      }
      window.gtag('event', 'page_view', {
        page_title: document.title,
        page_location: document.location.href
      })
    })
  }

  // Define trackEvent function.
  // See:
  //  https://www.analyticsmania.com/post/how-to-track-events-with-google-analytics-4-and-google-tag-manager/
  //  https://support.google.com/analytics/answer/9267735
  const trackEvent = (action, params = {}) => {
    if (window.gtag === undefined) {
      return
    }
    window.gtag('event', action, params)
  }

  // Inject $googleAnalytics in Vue, context and store.
  inject('googleAnalytics', {
    trackEvent
  })
}
