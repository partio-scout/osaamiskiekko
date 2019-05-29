import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import { IntlProvider, addLocaleData } from 'react-intl';
import { ThemeProvider } from 'styled-components';

import fi from 'react-intl/locale-data/fi';
import translations from './translations/translations';
import { defaultTheme } from './styles/Themes';

addLocaleData([...fi, translations]);

export const wrapWithProviders = (component) => {

  return (
    <Router>
      <ThemeProvider theme={defaultTheme}>
        <IntlProvider locale={'fi'} messages={translations['fi']}>
          {component}
        </IntlProvider>
      </ThemeProvider>
    </Router>
  );
};
