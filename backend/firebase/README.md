# Firebase

A Firebase Function has been set up for the contact form.

## Local Firebase

To develop the function further, run it locally via the emulator.

1. Create the file `/firebase/functions/.runtimeconfig.json` with the following content:

```
{
  "sendinblue": {
    "apikey": "123"
  }
}

```

<sub>The apikey should be a development API key from Sendinblue.</sub>
<sub>Note that Firebase only accepts lowercase config variable names.</sub>

2. Run the following command in the `/firebase` folder:

  `firebase emulators:start`

3. Change the POST url in the contact form to the url listed by the above command.
The final POST will be something like this (change `email=...` to your email address)

```
curl --data "role=Opiskelija&subject=Mukaan+opiskelijana&name=Bob&email=your-email-as-a-developer@example.com&phone=123&message=Lorem+ipsum&devMode=1" http://localhost:5001/partio-osaamiskiekko-prod/europe-west1/app/contact
```

<sub>When `devMode` is `1`, the sender (`email=...`) will receive the email.

## Development & Production Firebase

**Currently there is no development Firebase project, there is only the production project.**

The Firebase project is set in `/firebase/.firebaserc`.

The Sendinblue API key and receiver email is set with the following commands in the `/firebase` folder:

```
firebase functions:config:set contact.receiveremail="firstname.lastname@kentauri.fi"
firebase functions:config:set sendinblue.apikey="123"
firebase deploy --only functions
```

You can check the current config with the following command in the `/firebase` folder:

```
firebase functions:config:get
```

To deploy changes in the code or config run the following command in the `/firebase` folder:

```
firebase deploy --only functions
```
