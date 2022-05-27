/**
 * Facebook Pixel integration.
 *
 * See:
 *
 * https://developers.facebook.com/docs/facebook-pixel/implementation
 * CookieConsent.js
 *
 * @param app
 * @param inject
 */
export default ({ app }, inject) => {
  // Get pixel ID.
  const pixelId = app.$config.facebookPixelId

  if (pixelId !== '') {
    // See: https://developers.facebook.com/docs/facebook-pixel/implementation/gdpr/
    /* eslint-disable */
    !function (f, b, e, v, n, t, s) {
      if (f.fbq) return;
      n = f.fbq = function () {
        n.callMethod ?
          n.callMethod.apply(n, arguments) : n.queue.push(arguments)
      };
      if (!f._fbq) f._fbq = n;
      n.push = n;
      n.loaded = !0;
      n.version = '2.0';
      n.queue = [];
      t = b.createElement(e);
      t.async = !0;
      t.src = v;
      s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s)
    }(window, document, 'script',
      'https://connect.facebook.net/en_US/fbevents.js');

    window.fbq('consent', app.$cookieConsent.hasConsent() ? 'grant' : 'revoke')

    window.fbq('init', pixelId)
    window.fbq('track', 'PageView')
    /* eslint-enable */

    // On each route change, send a page view.
    app.router.afterEach((to, from) => {
      if (window.fbq === undefined) {
        return
      }
      window.fbq('track', 'PageView')
    })
  }

  // Define trackEvent function.
  // See:
  //  https://developers.facebook.com/docs/facebook-pixel/implementation/conversion-tracking
  //  https://developers.facebook.com/docs/facebook-pixel/reference#standard-events
  const trackEvent = (action, params = {}) => {
    if (window.fbq === undefined) {
      return
    }
    window.fbq('track', action, params)
  }

  // Inject $facebookPixel in Vue, context and store.
  inject('facebookPixel', {
    trackEvent
  })
}
