import React, { useEffect, useState } from 'react';
import { LiveAnnouncer } from 'react-aria-live';
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
        const language = localStorage.getItem('language') || 'fi';
        setLanguage(language);
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

  const changeLanguage = (language) => {
    localStorage.setItem('language', language);
    setLanguage(language);
  };
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
    <LiveAnnouncer>
      <BrowserRouter>
        <Helmet>
          <html lang={language} />
          <title>{translations[language].title}</title>
          <script>
            {`
            (function(w,d,s,l,i){w[l] = w[l] || []; w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
            })(window,document,'script','dataLayer','GTM-NK65GGN');
            `}
            </script>
          
            <noscript>
            {`
              <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NK65GGN"
                height="0" width="0" style="display:none;visibility:hidden">
              </iframe>
            `}
            </noscript>
        </Helmet>
        <GlobalStateContext.Provider value={globalState}>
          <ThemeProvider theme={currentTheme}>
              <IntlProvider locale={language} messages={translations[language]}>
                <Routes />
              </IntlProvider>
            </ThemeProvider>
          </GlobalStateContext.Provider>
        </BrowserRouter>
      </LiveAnnouncer>
  );
}

export default App;
