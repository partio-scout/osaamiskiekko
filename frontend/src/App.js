import React, { Component } from 'react';
import './App.css';
// import styled from 'styled-components';
import Curve from './images/curve.svg';
// import { GlobalStyle } from './GlobalStyles';
import PlaceholderImage from './images/square-image.png';
import Navigation from './components/Navigation';
import SearchBox from './components/SearchBox';

class App extends Component {
  render() {
    return (
      <div>
        <header>
            <Navigation />
            <div className="header-container">
              <div className="header-text">
                <h1>Osaamiskiekon avulla hyödynnät osaamisesi monipuolisesti</h1>
                <p>Osaamiskiekon avulla löydät harrastus- ja vapaaehtoistoiminnassa hankitun osaamisen rinnakkain tutkintoon johtavien opintojen kanssa.</p>  
              </div>
              <div className="header-image-container">
                <img src={PlaceholderImage} alt="placeholder" className="header-image"/>
              </div>
            </div>
        </header>
        <div className="curve-container">
          <SearchBox />
          <img src={Curve} alt="Curve" className="curve-image"/>
        </div>
      </div>
    );
  }
}

export default App;
