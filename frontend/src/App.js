import React, { createContext, useState } from 'react';
import { GlobalStyle } from './styles/GlobalStyles';
import Curve from './components/Curve';
import Header from './components/Header.js'
import { IntlProvider, addLocaleData } from 'react-intl';
import en from 'react-intl/locale-data/en';
import fi from 'react-intl/locale-data/fi';
import se from 'react-intl/locale-data/se';
import translations from './translations/translations';
addLocaleData([...en, ...fi, ...se, translations]);

export const LanguageContext = createContext(null);

const App = () => { 
  const [language, setLanguage] = useState('fi');
    return (
      <LanguageContext.Provider value={setLanguage}>
        <IntlProvider locale={language} messages={translations[language]}>
          <div>
            <GlobalStyle />
            <Header />
            <Curve />
          </div>
        </IntlProvider>
      </LanguageContext.Provider>
    );
}

export default App;
