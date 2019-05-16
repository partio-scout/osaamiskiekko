import React from 'react';
import { IntlProvider, addLocaleData } from 'react-intl';
import { ThemeProvider } from 'styled-components';

import GlobalStateContext from './utils/GlobalStateContext';
import fi from 'react-intl/locale-data/fi';
import translations from './translations/translations';
import { defaultTheme } from './styles/Themes';

addLocaleData([...fi, translations]);

export default function renderWithProviders(component, globalState) {

  return (
    <GlobalStateContext.Provider value={globalState}>
      <ThemeProvider theme={defaultTheme}>
        <IntlProvider locale={'fi'} messages={translations['fi']}>
          {component}
        </IntlProvider>
      </ThemeProvider>
    </GlobalStateContext.Provider>
  );
};
