# Osaamiskiekko Web UI

### General guidelines

- Follow the framework style guide https://vuejs.org/style-guide/
- Define components using the Composition API (see https://vuejs.org/guide/extras/composition-api-faq.html for more information)
- Define components so that the script tags at the top of the file and the template tags are below them

- Do not use console.log or console.error, use the info and error functions provided by the logger plugin
- After creating a new component, add a short description about the use of the component inside the component script tags
- Use the Prettier configuration included in the repository

### Naming guidelines

- Vue components must named using pascal case
- Vue components must use the .vue filename extension
- Variables must be camel cased
- Constants must be capitalized

- Use the BEM naming convention for CSS variables. See https://getbem.com/naming/
- Use kebab-case when naming events emited from components, e.g. $emit('close-dialog') and define emited events as constants
- Use kebab-case when naming routes

- When creating new stores, follow the naming practices of Pinia. See https://pinia.vuejs.org/core-concepts/
- Use UPPER_SNAKE_CASE for localization object keys, e.g. { GREETING_TEXT: "Hello!" }
