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
  const [organizations, setOrganizations] = useState();
  const [schools, setSchools] = useState();
  const [nqfLevels, setNqfLevels] = useState();
  const [fieldOfStudies, setFieldOfStudies] = useState();
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(); // eslint-disable-line

  useEffect(() => {
    const fetchData = async () => {
      try {
        const nqfs = await Api.getNqfs();
        setNqfLevels(nqfs);
        const fieldOfStudies = await Api.getFieldofstudies();
        setFieldOfStudies(fieldOfStudies);
        const schools = await Api.getSchools();
        setSchools(schools);
        const orgs = await Api.getOrganizations();
        setOrganizations(orgs);
      } catch (err) {
        console.log('Error loading data', err);
        setError(err);
      }
      setIsLoading(false);
    }
    fetchData();
  }, []);

  const changeLanguage = (language) => setLanguage(language);
  const changeCurrentTheme = (theme) => { setCurrentTheme(theme) };

  const globalState = {
    language,
    changeLanguage,
    currentTheme,
    changeCurrentTheme,
    isLoading,
    nqfLevels,
    fieldOfStudies,
    schools, 
    organizations,
  }
  
  return (
    <BrowserRouter>
      <Helmet>
        <html lang={language} />
        <title>{translations[language].title}</title>
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
