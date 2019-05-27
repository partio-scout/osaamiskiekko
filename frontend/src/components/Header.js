import React from 'react';
import styled from 'styled-components';
import Navigation from './Navigation';
import { FormattedMessage } from 'react-intl';
import SearchBox from './SearchBox';
import HeaderImage from '../images/headerimage.jpg';

const S = {};
S.Header = styled.header`
margin: auto;
display: grid;
grid-template-areas: "nav nav" 
                     "text image"
                     "search search"
                     "curve curve";
grid-template-columns: 4fr 4fr;

.header-text {
  min-height: 600px;
  @media only screen and (max-width: 730px) {
    grid-column: 1 / 3;
    min-height: 420px;
  }
  @media only screen and (max-width: 860px) {
    padding: 20px;
  }
}

.header-image {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url(${HeaderImage}); 
  margin-top: -98px;
  @media only screen and (max-width: 730px) {
    display: none;
  } 
}

.curve {
  margin-top: -110px;
  grid-column: curve;
  @media only screen and (max-width: 860px) {
    margin-top: -170px;
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
      background-size: 100% 100%;
      background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors.accentColor} 0)`};
      background-repeat: no-repeat;
    }
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

path {
  fill: ${props => props.theme.colors.accentColor};
}
`;

export default function Header(props) {
  const { showResults, data, isLoading } = props;

  const svgCurve = (color) => 
    <svg version="1.1" viewBox="0 0 1440 370" xmlns="http://www.w3.org/2000/svg">
      <g fill="none" fillRule="evenodd">
        <g transform="translate(0 -644)" fill="#6DE5B8">
          <path d="m1440 1014c-227.33-46.667-467-70-719-70s-492.33 23.333-721 70v-300c228.67-46.667 469-70 721-70s491.67 23.333 719 70v300z" />
        </g>
      </g>
    </svg>

  return (
    <S.Header>
      <Navigation />
        <div className="header-text">
          <h1>
            <FormattedMessage id="header.h1" />
          </h1>
          <p className="important"><FormattedMessage id="header.important" /></p>
          <p><FormattedMessage id="header.p" /></p>
        </div>
      <div className="header-image"></div>
      <SearchBox showResults={showResults} data={data} isLoading={isLoading} />
      <div className="curve">
        {svgCurve()}
      </div> 
    </S.Header>
  )
}
