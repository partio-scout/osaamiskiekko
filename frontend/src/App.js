import React, { createContext, useState } from 'react';
import Routes from './Routes';
import { IntlProvider, addLocaleData } from 'react-intl';
import en from 'react-intl/locale-data/en';
import fi from 'react-intl/locale-data/fi';
import se from 'react-intl/locale-data/se';
import { BrowserRouter } from 'react-router-dom';
import translations from './translations/translations';
import { ThemeProvider } from 'styled-components';
import { defaultTheme } from './styles/Themes';
addLocaleData([...en, ...fi, ...se, translations]);

export const LanguageContext = createContext(null);

const App = () => { 
  const [language, setLanguage] = useState('fi');
    return (
      <BrowserRouter>
          <LanguageContext.Provider value={setLanguage}>
            <ThemeProvider theme={defaultTheme}>
              <IntlProvider locale={language} messages={translations[language]}>
                <Routes />
              </IntlProvider>
            </ThemeProvider>
          </LanguageContext.Provider>
        </BrowserRouter>
    );
}

export default App;
