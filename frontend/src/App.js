import React, { useState } from 'react';
import Routes from './Routes';
import { IntlProvider, addLocaleData } from 'react-intl';
import en from 'react-intl/locale-data/en';
import fi from 'react-intl/locale-data/fi';
import sv from 'react-intl/locale-data/sv';
import GlobalStateContext from './utils/GlobalStateContext';
import { BrowserRouter } from 'react-router-dom';
import translations from './translations/translations';
import { ThemeProvider } from 'styled-components';
import { defaultTheme } from './styles/Themes';
addLocaleData([...en, ...fi, ...sv, translations]);

const App = () => { 
  const [language, setLanguage] = useState('fi');
  const [theme, setTheme] = useState(defaultTheme);

  const changeLanguage = (language) => setLanguage(language);
  const changeTheme = (theme) => {console.log(theme); setTheme(theme) };

  const globalState = {
    language,
    changeLanguage,
    theme,
    changeTheme
  }
  
  return (
    <BrowserRouter>
      <GlobalStateContext.Provider value={globalState}>
        <ThemeProvider theme={theme}>
            <IntlProvider locale={language} messages={translations[language]}>
              <Routes />
            </IntlProvider>
          </ThemeProvider>
        </GlobalStateContext.Provider>
      </BrowserRouter>
  );
}

export default App;
