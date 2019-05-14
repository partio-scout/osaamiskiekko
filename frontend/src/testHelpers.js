import React from 'react';
import renderer from 'react-test-renderer';
import { IntlProvider, addLocaleData } from 'react-intl';
import { ThemeProvider } from 'styled-components';

import fi from 'react-intl/locale-data/fi';
import translations from './translations/translations';
import { defaultTheme } from './styles/Themes';

addLocaleData([...fi, translations]);

export default function renderWithProviders(component) {
  return renderer.create(
    <ThemeProvider theme={defaultTheme}>
      <IntlProvider locale='fi' messages={translations['fi']}>
        {component}
      </IntlProvider>
    </ThemeProvider>
  );
};
