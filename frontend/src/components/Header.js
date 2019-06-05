import React from 'react';
import styled from 'styled-components';
import Navigation from './Navigation';
import { FormattedMessage } from 'react-intl';
import HeaderImage from '../images/headerimage.jpg';
import Curve from '../components/Curve.js';

const S = {};
S.Header = styled.header`
 margin: auto;
 display: grid;
 grid-template-areas: "nav nav" 
                      "text image"
                      "curve curve";
 grid-template-columns: 4fr 4fr;
 margin-bottom: 50px;

.header-text {
  padding-left: 2rem;
  padding-bottom: 230px;
  min-height: 430px;

  @media only screen and (max-width: 767px) {
    grid-column: 1 / 3;
    min-height: 420px;
    padding: 20px 20px 90px 20px;
  }
}

.header-image {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url(${HeaderImage}); 
  margin-top: -98px;
  @media only screen and (max-width: 767px) {
    display: none;
  } 
}

h1 {
  color: ${props => props.theme.colors.text};
  font-family: ${props => props.theme.fonts.headingFontFamily};
  font-size: 42px;	
  font-weight: bold;	
  line-height: 46px;
  margin: 0px;
    span {
      background-size: 100% 2.5rem;
      background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors.textHighlight} 0)`};
      background-repeat: no-repeat;
      background-position-y: 70%;
    }
}

p {
	color: ${props => props.theme.colors.text};
  font-size: 20px;
  line-height: 30px;
}

p.important {
  font-size: 24px;
  color: red;
}

.header-container {
  min-height: 400px;
}
`;

export default function Header() {
  return (
    <S.Header>
      <Navigation />
        <div className="header-text">
          <h1>
            <FormattedMessage id="header.h1" />
          </h1>
          <p className="important">
            <FormattedMessage id="header.important" />
          </p>
          <p>
            <FormattedMessage id="header.p" />
          </p>
        </div>
      <div className="header-image"></div>
      <Curve />
    </S.Header>
  )
}
