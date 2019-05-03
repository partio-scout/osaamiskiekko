import React, { Component } from 'react';
import './App.css';
import 'semantic-ui-css/semantic.min.css';
import styled from 'styled-components';
import { Container } from 'semantic-ui-react';
import NavLinks from './components/NavLinks';
import Header from './components/Header';
import Curve from './images/curve.svg';
import { GlobalStyle } from './GlobalStyles';

const MainMenuDiv = styled.div`
  background-color: #DAD7FF;
  padding: 20px;
`;

const CurvedImage = styled.img`
  width: 100%;
  margin-top: -5px;
`;

class App extends Component {
  render() {
    return (
      <Container>
        <MainMenuDiv>
          <NavLinks></NavLinks>
          <Header></Header>
        </MainMenuDiv>
        <CurvedImage src={Curve}></CurvedImage>
        <GlobalStyle />
      </Container>
    );
  }
}

export default App;
