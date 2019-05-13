import React, { createContext, useState } from 'react';
import Routes from './Routes';
import { IntlProvider, addLocaleData } from 'react-intl';
import en from 'react-intl/locale-data/en';
import fi from 'react-intl/locale-data/fi';
import se from 'react-intl/locale-data/se';
import { BrowserRouter } from 'react-router-dom';
import translations from './translations/translations';
import { ThemeProvider } from 'styled-components';
import { defaultTheme, darkTheme } from './styles/Themes';
addLocaleData([...en, ...fi, ...se, translations]);

export const GlobalState = createContext(null);

const App = () => { 
  const [globalState, setGlobalState] = useState({
    language: 'fi',
    theme: 'defaultTheme'
  });
  const theme = globalState.theme === 'defaultTheme' ? defaultTheme : darkTheme;
  
  return (
    <BrowserRouter>
      <GlobalState.Provider value={[globalState, setGlobalState]}>
        <ThemeProvider theme={theme}>
            <IntlProvider locale={globalState.language} messages={translations[globalState.language]}>
              <Routes />
            </IntlProvider>
          </ThemeProvider>
        </GlobalState.Provider>
      </BrowserRouter>
  );
}

export default App;
