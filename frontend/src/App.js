import React, { Component } from 'react';
import { GlobalStyle } from './styles/GlobalStyles';
import Curve from './components/Curve';
import Header from './components/Header.js'

class App extends Component {
  render() {
    return (
      <div>
        <GlobalStyle />
        <Header />
        <Curve />
      </div>
    );
  }
}

export default App;
