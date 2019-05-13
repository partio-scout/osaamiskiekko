import React from 'react';
import styled from 'styled-components';
import Navigation from './Navigation';
import BackgroundImage from '../images/bg.png';
import { FormattedMessage } from 'react-intl';

const S = {};
S.Header = styled.header`
 margin: auto;
 background-color: ${props => props.theme.colors.osaamisKiekkoSand};

h1 {
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  font-size: 42px;	
  font-weight: bold;	
  line-height: 46px;
  margin: 0px;
}

p {
	color: ${props => props.theme.colors.osaamisKiekkoBlue};
	font-size: 18px;
	line-height: 24px;
}

p.important {
  font-size: 24px;
  color: red;
}

.header-container {
  display: grid;
  grid-template-columns: 1fr 2fr 2fr 1fr;
  min-height: 400px;
}

.header-text {
  display: flex;
  flex-direction: column;
  justify-content: center;
  grid-column-start: 2;
}

.header-image {
  border-radius: 50%;
  border: solid 1px gray;
  max-height: 300px;
}

.header-image-container {
  display: flex;
  justify-content: center;
  align-items: center;
}

  @media only screen and (max-width: 600px) { 
    .header-image-container {
      display: none;
    }
  }
`;

export default function Header() {
  return (
    <S.Header>
      <Navigation />
      <div className="header-container">
        <div className="header-text">
          <h1>
            <FormattedMessage id="header.h1" />
          </h1>
          <p className="important"><FormattedMessage id="header.important" /></p>
          <p><FormattedMessage id="header.p" /></p>
        </div>
        <div className="header-image-container">
          <img src={BackgroundImage} alt="placeholder" className="header-image" />
        </div>
      </div>
    </S.Header>
  )
}
