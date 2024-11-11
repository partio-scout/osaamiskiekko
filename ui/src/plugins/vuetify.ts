// Styles
import "@mdi/font/css/materialdesignicons.css";
import "vuetify/styles";

// Composables
import { createVuetify } from "vuetify";

// Icons
import { aliases, md } from "vuetify/iconsets/md";

// https://vuetifyjs.com/en/introduction/why-vuetify/#feature-guides
export default createVuetify({
  icons: {
    // Uses the Material Icons from fonts.googleapis.com by default
    defaultSet: "md",
    aliases,
    sets: {
      md
    }
  },
  theme: {
    themes: {
      light: {
        colors: {
          blue: '#5A9CF7',
          purple: '#E6B8F6',
          pink: '#FFB8F2',
          yellow: '#FFFA84',
          turquoise: '#6CF4DE',
          h1: '#F5F8FC',
          h2h3: '#E7EBF6',
          'body-text': '#D8DBE6',
          'menu-link': '#797A82',
          'bg-gradient-start': '#0B0D0F',
          'bg-gradient-end': '#111417',
        },
      },
    },
  }
});
