import moment from 'moment'

export default ({ app }, inject) => {
  moment.locale(app.$config.site.localeId.substr(0, 3))
}
