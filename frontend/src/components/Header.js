import React from 'react';
import styled from 'styled-components';
import Navigation from './Navigation';
import SweetJesus from '../images/sweetjesusface.png';

const S = {};
S.Header = styled.header`
 margin: auto;
 background-color: #FFEED2;

h1 {
  color: #241C80;
  font-size: 42px;	
  font-weight: bold;	
  line-height: 46px;
  margin: 0px;
}

p {
	color: #241C80;
	font-size: 18px;
	line-height: 24px;
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
  border: solid 1px #4736FF;
  max-height: 259px;
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
          <h1>Osaamiskiekon avulla hyödynnät osaamisesi monipuolisesti</h1>
          <p>Osaamiskiekon avulla löydät harrastus- ja vapaaehtoistoiminnassa hankitun osaamisen rinnakkain tutkintoon johtavien opintojen kanssa.</p>
        </div>
        <div className="header-image-container">
          <img src={SweetJesus} alt="placeholder" className="header-image" />
        </div>
      </div>
    </S.Header>
  )
}