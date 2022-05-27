import Vue from 'vue'
import moment from 'moment'
import Util from './../assets/js/Util'

/**
 * Replaces tags in a text.
 *
 * @param Text, e.g. "Hello [firstName]",
 * @param Tags, e.g. {firstName: 'Bob'}
 */
Vue.filter('tags', (text, tags = {}) => {
  return Util.replaceTags(text, tags)
})

/**
 * Formats a date.
 *
 * @param val Can be an integer (seconds), Date or String (e.g. '2021-10-01').
 * @param format Moment format
 */
Vue.filter('dateFormat', (val, format) => {
  if (val === undefined || val === null) {
    return ''
  }

  let m

  if ((typeof val === 'string') || (val instanceof Date)) {
    m = moment(val)
  } else {
    m = moment.unix(val)
  }

  return m.format(format)
})

/**
 * Formats a number.
 */
Vue.filter('number', (value, decimals, decimalSign, thousandSeparator) => {
  if (typeof value !== 'number') {
    return ''
  }

  return Util.formatNumber(value, decimals, decimalSign, thousandSeparator)
})

/**
 * Formats a number in a currency (e.g. a price). Only EUR is supported.
 */
Vue.filter('currency', (value, decimals, decimalSign, thousandSeparator) => {
  if (typeof value !== 'number') {
    return ''
  }

  return Util.formatCurrency(value, decimals, decimalSign, thousandSeparator)
})

/**
 * Removes the scheme from a url.
 */
Vue.filter('urlWithoutScheme', (url) => {
  if (typeof url !== 'string') {
    return ''
  }

  url = url.replace('https://', '')
  url = url.replace('http://', '')

  return url
})

/**
 * Shortens a text to a maximum length. If it's longer, three dots are appended.
 */
Vue.filter('shorten', (text, maxLength) => {
  if (typeof text !== 'string') {
    return ''
  }

  if (text.length > maxLength - 3) {
    text = text.substr(0, maxLength - 3) + '...'
  }

  return text
})
