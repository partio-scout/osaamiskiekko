import moment from 'moment'

/**
 * Helper functionality.
 */
export default class {
  /**
   * Checks whether the device is a touch device.
   *
   * See: https://stackoverflow.com/a/52855084
   *
   * @returns {boolean}
   */
  static isTouch () {
    return window.matchMedia('(pointer: coarse)').matches
  }

  /**
   * Replaces tags in a text.
   *
   * @param Text, e.g. "Hello [firstName]",
   * @param Tags, e.g. {firstName: 'Bob'}
   */
  static replaceTags (text, tags = {}) {
    for (const k in tags) {
      text = text.replace('[' + k + ']', tags[k])
    }
    return text
  }

  /**
   * Formats a time period, e.g. "1.2.2021 - 13.10.2021
   *
   * @param format1 Moment format
   * @param format2 Moment format
   * @param date1 Date or string
   * @param date2 Date or string
   * @param localeId string
   * @returns {string}
   */
  static timePeriod (format1, format2, date1, date2, localeId = null) {
    if (localeId !== 'et_ee') {
      return moment(date1).format(format1) + ' - ' + moment(date2).format(format2)
    } else {
      return moment(date1).format(format1) + '-' + moment(date2).format(format2)
    }
  }

  /**
   * Capitalizes the first letter
   * @param str
   * @returns {string}
   */
  static capitalizeFirstLetter (str) {
    return str.charAt(0).toUpperCase() + str.slice(1)
  }

  /**
   * Shuffles an array.
   * See: https://stackoverflow.com/a/2450976
   *
   * @param array
   * @returns {*}
   */
  static shuffle (array) {
    let currentIndex = array.length
    let temporaryValue
    let randomIndex

    // While there remain elements to shuffle...
    while (currentIndex !== 0) {
      // Pick a remaining element...
      randomIndex = Math.floor(Math.random() * currentIndex)
      currentIndex -= 1

      // And swap it with the current element.
      temporaryValue = array[currentIndex]
      array[currentIndex] = array[randomIndex]
      array[randomIndex] = temporaryValue
    }

    return array
  }

  /**
   * Rounds a number.
   *
   * @param number
   * @param decimals
   * @returns {number}
   */
  static round (number, decimals = 0) {
    const n = 10 ** decimals * number
    return Math.round(n) / (10 ** decimals)
  }

  /**
   * Returns a random integer between an interval (min and max inclusive).
   *
   * @param min
   * @param max
   * @returns {number}
   */
  static randomIntInclusive (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min
  }

  /**
   * Formats a number.
   */
  static formatNumber (value, decimals = 2, decimalSign = ',', thousandSeparator = ' ') {
    if (decimals !== 0) {
      value = this.round(value, decimals)
    }

    value = value.toFixed(decimals)

    if (decimalSign !== '.') {
      value = value.replace('.', decimalSign)
    }

    // See: https://stackoverflow.com/a/2901298
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, thousandSeparator)

    return value
  }

  /**
   * Formats a number in a currency (e.g. a price). Only EUR is supported.
   */
  static formatCurrency (value, decimals = 2, decimalSign = ',', thousandSeparator = ' ', currency = 'EUR') {
    value = this.formatNumber(value, decimals, decimalSign, thousandSeparator) + ' €'

    return value
  }

  /**
   * Validates an email address.
   *
   * See: https://stackoverflow.com/a/9204568
   *
   * @param email
   * @returns {boolean}
   */
  static validateEmail (email) {
    return /\S+@\S+\.\S+/.test(email.toLowerCase())
  }

  /**
   * Validates a phone number.
   *
   * The phone number can contain spaces and numbers.
   * It can also start with a plus sign (+).
   * It must have 6 or more numbers.
   *
   * @param phone
   * @returns {boolean}
   */
  static validatePhone (phone) {
    if (/^\+?[0-9 ]+$/.test(phone.toLowerCase()) === true) {
      const numberCount = (phone.match(/[0-9]/g) || []).length
      if (numberCount >= 6) {
        return true
      }
    }

    return false
  }
}
