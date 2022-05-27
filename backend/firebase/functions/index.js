/**
 * Firebase function for the contact form.
 *
 * See: README.md
 *
 * See:
 *  https://firebase.google.com/docs/functions/get-started
 *  https://firebase.google.com/docs/functions/http-events#using_express_request_and_response_objects
 *  https://firebase.google.com/docs/functions/local-emulator
 *  https://firebase.google.com/docs/functions/config-env
 *  https://firebase.google.com/docs/functions/reporting-errors
 *
 *  https://developers.sendinblue.com/reference/sendtransacemail
 */

const functions = require('firebase-functions')
const express = require('express')
const cors = require('cors')
const SibApiV3Sdk = require('sib-api-v3-sdk')

const app = express()

// Automatically allow cross-origin requests.
app.use(cors({ origin: true }))

// Define helper functions.
function getPostParam(req, name, defaultValue = null, throwErrorIfEmpty = true, trim = true) {
  let value = defaultValue

  if (req.body[name]) {
    value = req.body[name]

    if (trim === true) {
      value = value.trim()
    }
  }

  if (throwErrorIfEmpty === true) {
    if (value === null || value === '') {
      throw new Error('Parameter ' + name + ' is empty.')
    }
  }

  return value
}

/**
 * Contact POST request.
 */
app.post('/contact', (req, res) => {
  const role = getPostParam(req, 'role')
  const subject = getPostParam(req, 'subject')
  const name = getPostParam(req, 'name')
  const email = getPostParam(req, 'email')
  const phone = getPostParam(req, 'phone', '', false)
  const message = getPostParam(req, 'message')
  const devMode = getPostParam(req, 'devMode', '0') === '1'

  if (functions.config().sendinblue === undefined || functions.config().sendinblue.apikey === undefined) {
    throw new Error('No sendinblue.apikey in config.')
  }
  if (devMode === false) {
    // If devMode is true, the sender will receive the email. No need for functions.config().contact.receiveremail
    if (functions.config().contact === undefined || functions.config().contact.receiveremail === undefined) {
      throw new Error('No contact.receiveremail in config.')
    }
  }

  let defaultClient = SibApiV3Sdk.ApiClient.instance

  let apiKey = defaultClient.authentications['api-key'];
  apiKey.apiKey = functions.config().sendinblue.apikey

  let apiInstance = new SibApiV3Sdk.TransactionalEmailsApi()

  let sendSmtpEmail = new SibApiV3Sdk.SendSmtpEmail()

  let body = 'Olen: ' + role + '\n'
  body+= 'Aihe: ' + subject + '\n'
  body+= 'Nimi: ' + name + '\n'
  body+= 'Sähköpostiosoite: ' + email + '\n'
  body+= 'Puhelin: ' + phone + '\n\n'
  body+= 'Viesti: \n\n' + message + '\n\n'

  // If devMode is true, the sender will receive the email.
  let toEmail
  if (devMode === true) {
    toEmail = email
  } else {
    toEmail = functions.config().contact.receiveremail
  }

  sendSmtpEmail.subject = 'Osaamiskiekko yhteyslomake: ' + subject
  sendSmtpEmail.textContent = body
  sendSmtpEmail.sender = {
    'name': name,
    'email': email
  }
  sendSmtpEmail.to = [
    {
      'email': toEmail
    }
  ]
  sendSmtpEmail.replyTo = {
    'name': name,
    'email': email
  }

  apiInstance.sendTransacEmail(sendSmtpEmail).then(function(data) {
    res.json({
      statusCode: 'success',
      errorCode: null
    })
  }, function(error) {
    // Log the error.
    console.error(new Error('Sendinblue returned an error.'), new Error(error))

    res.status(500).json({
      statusCode: 'error',
      errorCode: 'unknown'
    })
  })
})

// Expose Express API as a single Cloud Function.
exports.app = functions.region('europe-west1').https.onRequest(app)
