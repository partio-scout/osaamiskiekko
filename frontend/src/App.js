import React, { useEffect, useState } from 'react';
import { Helmet } from 'react-helmet';
import { IntlProvider, addLocaleData } from 'react-intl';
import en from 'react-intl/locale-data/en';
import fi from 'react-intl/locale-data/fi';
import sv from 'react-intl/locale-data/sv';

import Routes from './Routes';
import GlobalStateContext from './utils/GlobalStateContext';
import { BrowserRouter } from 'react-router-dom';
import translations from './translations/translations';
import { ThemeProvider } from 'styled-components';
import { defaultTheme } from './styles/Themes';
import * as Api from './api/Api';
addLocaleData([...en, ...fi, ...sv, translations]);

const App = () => { 
  const [language, setLanguage] = useState('fi');
  const [currentTheme, setCurrentTheme] = useState(defaultTheme);
  const [nqfLevels, setNqfLevels] = useState(null);
  const [fieldOfStudies, setFieldOfStudies] = useState(null);

  useEffect(() => {
    const fetchFieldsAndNqfData = async () => {
      const nqfs = await Api.getNqfs();
      setNqfLevels(nqfs);
      const fieldOfStudies = await Api.getFieldofstudies();
      setFieldOfStudies(fieldOfStudies);
    }
    fetchFieldsAndNqfData();
  }, []);

  const changeLanguage = (language) => setLanguage(language);
  const changeCurrentTheme = (theme) => { setCurrentTheme(theme) };

  const globalState = {
    language,
    changeLanguage,
    currentTheme,
    changeCurrentTheme,
    nqfLevels,
    fieldOfStudies
  }
  
  return (
    <BrowserRouter>
      <Helmet>
        <html lang={language} />
      </Helmet>
      <GlobalStateContext.Provider value={globalState}>
        <ThemeProvider theme={currentTheme}>
            <IntlProvider locale={language} messages={translations[language]}>
              <Routes />
            </IntlProvider>
          </ThemeProvider>
        </GlobalStateContext.Provider>
      </BrowserRouter>
  );
}

export default App;
