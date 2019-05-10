import React, { Component } from 'react';
import { GlobalStyle } from './styles/GlobalStyles';
import Curve from './components/Curve';
import Header from './components/Header.js'
import { IntlProvider, addLocaleData } from 'react-intl';
import en from 'react-intl/locale-data/en';
import fi from 'react-intl/locale-data/fi';
import se from 'react-intl/locale-data/se';
import translations from './translations/translations';
addLocaleData([...en, ...fi, ...se, translations]);

class App extends Component {
  render() {
    return (
      <IntlProvider locale="fi" messages={translations.fi}>
        <div>
          <GlobalStyle />
          <Header />
          <Curve />
        </div>
      </IntlProvider>
    );
  }
}

export default App;
