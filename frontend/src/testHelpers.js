import React from 'react';
import { IntlProvider, addLocaleData } from 'react-intl';
import { ThemeProvider } from 'styled-components';

import fi from 'react-intl/locale-data/fi';
import translations from './translations/translations';
import { defaultTheme } from './styles/Themes';

addLocaleData([...fi, translations]);

export const wrapWithProviders = (component) => {

  return (
    <ThemeProvider theme={defaultTheme}>
      <IntlProvider locale={'fi'} messages={translations['fi']}>
        {component}
      </IntlProvider>
    </ThemeProvider>
  );
};
